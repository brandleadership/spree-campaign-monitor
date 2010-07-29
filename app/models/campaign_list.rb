require 'campaigning'

class CampaignList < ActiveRecord::Base

  belongs_to :campaign_monitor
  has_many :newsletter_subscriptions

  def update_subscribers
    client = Campaigning::Client.new(self.campaign_monitor.client_key, self.campaign_monitor.name, { :apiKey => self.campaign_monitor.api_key })
    client.lists.each do |list|
      list.get_all_active_subscribers.each do |subscriber|
        unless NewsletterSubscription.find(:first, :conditions => { :email => subscriber.emailAddress })
          name = subscriber.name.split(' ')
          self.newsletter_subscriptions.create(:first_name => name.first, :last_name => name.last, :email => subscriber.emailAddress, :want_to_subscribe => true, :imported => true)
        end
      end
    end
  end

end
