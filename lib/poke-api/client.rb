module Poke
  module API
    class Client
      include Logging
      attr_accessor :endpoint, :sig_loaded, :refresh_token,
                    :lat, :lng, :alt, :http_client, :ticket, :proxy
      attr_reader   :sig_path, :auth

      MAX_CHECK_EXPIRY_ATTEMPTS_COUNT = 10

      def initialize
        @endpoint   = 'https://pgorelease.nianticlabs.com/plfe/rpc'
        @reqs       = []
        @lat        = 0
        @lng        = 0
        @alt        = rand(1..9)
        @ticket     = Auth::Ticket.new
        @sig_loaded = false
        @check_expiry_attempts_count = 0
        @proxy = false
      end

      def login(username, password, provider)
        @username, @password, @provider = username, password, provider.upcase
        raise Errors::InvalidProvider, provider unless %w(PTC GOOGLE).include?(@provider)

        begin
          @auth = Auth.const_get(@provider).new(@username, @password, @refresh_token, @proxy)
          @auth.connect
        rescue StandardError => ex
          raise Errors::LoginFailure.new(@provider, ex)
        end

        resp = initialize_ticket
        logger.info "[+] Login with #{@provider} Successful"

        resp
      end

      def call
        raise Errors::LoginRequired unless @auth
        raise Errors::NoRequests if @reqs.empty?

        check_expiry
        req = RequestBuilder.new(@auth, [@lat, @lng, @alt], @endpoint, @http_client, @proxy)

        begin
          resp = req.request(@reqs, self)
        rescue StandardError => ex
          raise Errors::UnknownProtoFault, ex
        ensure
          @reqs = []
          logger.info '[+] Cleaning up RPC requests'
        end

        resp
      end

      def activate_signature(file_path)
        if File.exist?(file_path)
          logger.info "[+] File #{file_path} has been set for signature generation"
          @sig_path = file_path
        else
          raise Errors::InvalidSignatureFilePath, file_path
        end
      end

      def store_location(loc)
        pos = Poke::API::Helpers.get_position(loc).first
        logger.info "[+] Given location: #{pos.address}"

        logger.info "[+] Lat/Long/Alt: #{pos.latitude}, #{pos.longitude}"
        @lat, @lng = pos.latitude, pos.longitude
      end

      def store_lat_lng(lat, lng)
        logger.info "[+] Lat/Long: #{lat}, #{lng}"
        @lat, @lng = lat, lng
      end

      def inspect
        "#<#{self.class.name} @auth=#{@auth} @reqs=#{@reqs} " \
        "@lat=#{@lat} @lng=#{@lng} @alt=#{@alt}>"
      end

      private

      def initialize_ticket
        get_hatched_eggs
        call
      end

      def check_expiry
        @check_expiry_attempts_count += 1
        raise Errors::CheckExpiryFailure if @check_expiry_attempts_count > MAX_CHECK_EXPIRY_ATTEMPTS_COUNT

        unless @ticket.has_ticket?
          now = Helpers.fetch_time(ms: false)

          logger.info "[+] Attempt #{@check_expiry_attempts_count} of #{MAX_CHECK_EXPIRY_ATTEMPTS_COUNT}"
          logger.info "[+] Auth expiry: #{Time.at @auth.expiry}"
          if now < (@auth.expiry - 30)
            duration = format('%02d:%02d:%02d', *Helpers.format_time_diff(now, @auth.expiry, false))
            logger.info "[+] Provider access token is valid for #{duration}"
            return
          end

          logger.info "[+] Refreshing access token as it is no longer valid"
          login(@username, @password, @provider)
        end
      end

      def method_missing(method, *args)
        POGOProtos::Networking::Requests::RequestType.const_get(method.upcase)
        @reqs << (args.empty? ? method.to_sym.upcase : { method.to_sym.upcase => args.first })
      rescue NameError
        super
      end
    end
  end
end
