# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: POGOProtos/Enums/TutorialState.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_enum "POGOProtos.Enums.TutorialState" do
    value :LEGAL_SCREEN, 0
    value :AVATAR_SELECTION, 1
    value :ACCOUNT_CREATION, 2
    value :POKEMON_CAPTURE, 3
    value :NAME_SELECTION, 4
    value :POKEMON_BERRY, 5
    value :USE_ITEM, 6
    value :FIRST_TIME_EXPERIENCE_COMPLETE, 7
    value :POKESTOP_TUTORIAL, 8
    value :GYM_TUTORIAL, 9
  end
end

module POGOProtos
  module Enums
    TutorialState = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Enums.TutorialState").enummodule
  end
end