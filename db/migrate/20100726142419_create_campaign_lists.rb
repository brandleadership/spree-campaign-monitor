class CreateCampaignLists < ActiveRecord::Migration
  def self.up
    create_table :campaign_lists do |t|
      t.string :name
      t.string :list_key
      t.integer :campaign_monitor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :campaign_lists
  end
end
