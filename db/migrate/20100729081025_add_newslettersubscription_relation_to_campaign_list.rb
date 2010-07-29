class AddNewslettersubscriptionRelationToCampaignList < ActiveRecord::Migration
  def self.up
    add_column :newsletter_subscriptions, :campaign_list_id, :integer
  end

  def self.down
    remove_column :newsletter_subscriptions, :campaign_list_id
  end
end