# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: POGOProtos.Inventory.proto

require 'google/protobuf'

require_relative 'pogoprotos_inventory_item'
require_relative 'pogoprotos_enums'
require_relative 'pogoprotos_data'
require_relative 'pogoprotos_data_player'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "POGOProtos.Inventory.AppliedItem" do
    optional :item_id, :enum, 1, "POGOProtos.Inventory.Item.ItemId"
    optional :item_type, :enum, 2, "POGOProtos.Inventory.Item.ItemType"
    optional :expire_ms, :int64, 3
    optional :applied_ms, :int64, 4
  end
  add_message "POGOProtos.Inventory.AppliedItems" do
    repeated :item, :message, 4, "POGOProtos.Inventory.AppliedItem"
  end
  add_message "POGOProtos.Inventory.Candy" do
    optional :family_id, :enum, 1, "POGOProtos.Enums.PokemonFamilyId"
    optional :candy, :int32, 2
  end
  add_message "POGOProtos.Inventory.EggIncubator" do
    optional :id, :string, 1
    optional :item_id, :enum, 2, "POGOProtos.Inventory.Item.ItemId"
    optional :incubator_type, :enum, 3, "POGOProtos.Inventory.EggIncubatorType"
    optional :uses_remaining, :int32, 4
    optional :pokemon_id, :uint64, 5
    optional :start_km_walked, :double, 6
    optional :target_km_walked, :double, 7
  end
  add_message "POGOProtos.Inventory.EggIncubators" do
    repeated :egg_incubator, :message, 1, "POGOProtos.Inventory.EggIncubator"
  end
  add_message "POGOProtos.Inventory.InventoryDelta" do
    optional :original_timestamp_ms, :int64, 1
    optional :new_timestamp_ms, :int64, 2
    repeated :inventory_items, :message, 3, "POGOProtos.Inventory.InventoryItem"
  end
  add_message "POGOProtos.Inventory.InventoryItem" do
    optional :modified_timestamp_ms, :int64, 1
    optional :deleted_item, :message, 2, "POGOProtos.Inventory.InventoryItem.DeletedItem"
    optional :inventory_item_data, :message, 3, "POGOProtos.Inventory.InventoryItemData"
  end
  add_message "POGOProtos.Inventory.InventoryItem.DeletedItem" do
    optional :pokemon_id, :fixed64, 1
  end
  add_message "POGOProtos.Inventory.InventoryItemData" do
    optional :pokemon_data, :message, 1, "POGOProtos.Data.PokemonData"
    optional :item, :message, 2, "POGOProtos.Inventory.Item.ItemData"
    optional :pokedex_entry, :message, 3, "POGOProtos.Data.PokedexEntry"
    optional :player_stats, :message, 4, "POGOProtos.Data.Player.PlayerStats"
    optional :player_currency, :message, 5, "POGOProtos.Data.Player.PlayerCurrency"
    optional :player_camera, :message, 6, "POGOProtos.Data.Player.PlayerCamera"
    optional :inventory_upgrades, :message, 7, "POGOProtos.Inventory.InventoryUpgrades"
    optional :applied_items, :message, 8, "POGOProtos.Inventory.AppliedItems"
    optional :egg_incubators, :message, 9, "POGOProtos.Inventory.EggIncubators"
    optional :candy, :message, 10, "POGOProtos.Inventory.Candy"
  end
  add_message "POGOProtos.Inventory.InventoryUpgrade" do
    optional :item_id, :enum, 1, "POGOProtos.Inventory.Item.ItemId"
    optional :upgrade_type, :enum, 2, "POGOProtos.Inventory.InventoryUpgradeType"
    optional :additional_storage, :int32, 3
  end
  add_message "POGOProtos.Inventory.InventoryUpgrades" do
    repeated :inventory_upgrades, :message, 1, "POGOProtos.Inventory.InventoryUpgrade"
  end
  add_enum "POGOProtos.Inventory.EggIncubatorType" do
    value :INCUBATOR_UNSET, 0
    value :INCUBATOR_DISTANCE, 1
  end
  add_enum "POGOProtos.Inventory.InventoryUpgradeType" do
    value :UPGRADE_UNSET, 0
    value :INCREASE_ITEM_STORAGE, 1
    value :INCREASE_POKEMON_STORAGE, 2
  end
end

module POGOProtos
  module Inventory
    AppliedItem = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.AppliedItem").msgclass
    AppliedItems = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.AppliedItems").msgclass
    Candy = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.Candy").msgclass
    EggIncubator = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.EggIncubator").msgclass
    EggIncubators = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.EggIncubators").msgclass
    InventoryDelta = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryDelta").msgclass
    InventoryItem = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryItem").msgclass
    InventoryItem::DeletedItem = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryItem.DeletedItem").msgclass
    InventoryItemData = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryItemData").msgclass
    InventoryUpgrade = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryUpgrade").msgclass
    InventoryUpgrades = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryUpgrades").msgclass
    EggIncubatorType = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.EggIncubatorType").enummodule
    InventoryUpgradeType = Google::Protobuf::DescriptorPool.generated_pool.lookup("POGOProtos.Inventory.InventoryUpgradeType").enummodule
  end
end
