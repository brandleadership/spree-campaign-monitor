require 'campaigning'

class NewsletterSubscriptionObserver < ActiveRecord::Observer
  observe :newsletter_subscription



  def after_create(newsletter_subscription)
    subscriber = Campaigning::Subscriber.new(newsletter_subscription.email,
                                             newsletter_subscription.first_name + " " + newsletter_subscription.last_name,
                                             Time.now,
                                             true,
                                             nil,
                                             {:apiKey => CampaignMonitor.active.first.api_key})
    subscriber.add!(CampaignMonitor.active.first.list_id)
  end

  def after_update(newsletter_subscription)
    puts newsletter_subscription
  end
  
end