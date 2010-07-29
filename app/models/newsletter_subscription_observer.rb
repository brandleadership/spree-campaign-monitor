require 'campaigning'

class NewsletterSubscriptionObserver < ActiveRecord::Observer

  observe :newsletter_subscription


  def after_create(newsletter_subscription)
    unless newsletter_subscription.imported
      subscriber = campaign_subscriber(newsletter_subscription)
      answer = subscriber.add_and_resubscribe!(newsletter_subscription.campaign_list.list_key)
      unless answer.code.eql?0
        newsletter_subscription.active = false
        newsletter_subscription.save
      end
    end
  rescue
    logger.error "Newsletter subscription from #{newsletter_subscription.email} caused an error on create in campaign monitor"
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
  rescue
    logger.error "Newsletter subscription from #{newsletter_subscription.email} caused an error on update in campaign monitor"
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
                                             { :apiKey => newsletter_subscription.campaign_list.campaign_monitor.api_key })
  end
end