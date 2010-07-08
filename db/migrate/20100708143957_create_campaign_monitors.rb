class CreateCampaignMonitors < ActiveRecord::Migration
  def self.up
    create_table :campaign_monitors do |t|
      t.string :client
      t.string :api_key
      t.timestamps
    end
  end

  def self.down
    drop_table :campaign_monitors
  end
end
