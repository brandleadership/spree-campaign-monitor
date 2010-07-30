class ChangeNewsletterSubscriptionStatus < ActiveRecord::Migration
  def self.up
    change_column_default :newsletter_subscriptions, :active, false
  end

  def self.down
    change_column_default :newsletter_subscriptions, :active, true
  end
end