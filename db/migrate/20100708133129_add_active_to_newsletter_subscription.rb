class AddActiveToNewsletterSubscription < ActiveRecord::Migration
  def self.up
    add_column :newsletter_subscriptions, :active, :boolean, :default => true
  end

  def self.down
    remove_column :newsletter_subscriptions, :active
  end
end