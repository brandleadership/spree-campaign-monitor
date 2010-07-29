require 'campaigning'

class NewsletterSubscriptionObserver < ActiveRecord::Observer

  observe :newsletter_subscription


  def after_create(newsletter_subscription)
    unless newsletter_subscription.imported
      answer = campaign_subscriber(newsletter_subscription).add!(CampaignMonitor.find(:first).list_key)
      unless answer.code.eql?0
        newsletter_subscription.active = false
        newsletter_subscription.save
      end
    end
  end

  def after_update(newsletter_subscription)
    subscription = campaign_subscriber(newsletter_subscription)
    list = CampaignMonitor.find(:first).list_key
    unless newsletter_subscription.active
      if subscription.is_subscribed?(list)
        subscription.unsubscribe!(list)
      end
    else
      subscription.add_and_resubscribe!(list)
    end
  end

  private

  #
  # Returns a Campaigning::Subscriber class generated from newsletter subscription model
  #
  def campaign_subscriber(newsletter_subscription)
    Campaigning::Subscriber.new(newsletter_subscription.email,
                                             newsletter_subscription.first_name + " " + newsletter_subscription.last_name,
                                             Time.now,
                                             true,
                                             nil,
                                             {:apiKey => CampaignMonitor.find(:first).api_key})
  end
end