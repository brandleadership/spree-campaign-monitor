class AddImportedToNewsletterSubscription < ActiveRecord::Migration
  def self.up
    add_column :newsletter_subscriptions, :imported, :boolean, :default => false
  end

  def self.down
    remove_column :newsletter_subscriptions, :imported
  end
end