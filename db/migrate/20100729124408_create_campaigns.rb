class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.integer :campaign_monitor_id
      t.string :campaign_key
      t.string :subject
      t.string :name
      t.date :sent_date
      t.integer :total_recipients

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
