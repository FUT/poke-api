module Poke
  module API
    class Errors
      class InvalidProvider < StandardError
        def initialize(provider)
          super("Invalid provider #{provider}.")
        end
      end

      class LoginRequired < StandardError
        def initialize
          super('Not logged in currently, please login.')
        end
      end

      class InvalidRequestEntry < StandardError
        def initialize(subreq)
          super("Subrequest entry #{subreq} is invalid.")
        end
      end

      class UnknownProtoFault < StandardError
        def initialize(error)
          super("An unknown proto fault has occured => [#{error} @ #{error.backtrace.first}]")
        end
      end

      class GoogleAuthenticationFailure < StandardError
        def initialize(token, response)
          super("Unable to login to Google, could not find => #{token} in #{response}")
        end
      end

      class GoogleTwoFactorAuthenticationFailure < StandardError
        def initialize
          super("Two-factor authentication not supported. Create an app-specific password to log in.")
        end
      end

      class CheckExpiryFailure < StandardError
        def initialize
          super("Check expiry function failed more than 10 times in a row. The account is not valid.")
        end
      end

      class LoginFailure < StandardError
        def initialize(provider, error)
          super("Unable to login to #{provider} => [#{error} @ #{error.backtrace.first}]")
        end
      end

      class InvalidEndpoint < StandardError
        def initialize
          super("Unable to fetch endpoint, please try to login again.")
        end
      end

      class NoRequests < StandardError
        def initialize
          super("Can not call without any requests set")
        end
      end

      class InvalidSignatureFilePath < StandardError
        def initialize(file_path)
          super("Could not find file #{file_path} for signature generation")
        end
      end

      class InvalidLevel < StandardError
        def initialize(level)
          super("Level #{level} is invalid, must be between 0 and 30.")
        end
      end
    end
  end
end
