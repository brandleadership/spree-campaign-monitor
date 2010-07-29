class CreateCampaignMonitors < ActiveRecord::Migration
  def self.up
    create_table :campaign_monitors do |t|
      t.string      :name
      t.string      :api_key
      t.string      :client_key
      t.timestamps
    end
  end

  def self.down
    drop_table :campaign_monitors
  end
end
