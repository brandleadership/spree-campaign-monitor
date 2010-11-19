class NewsletterSubscription < ActiveRecord::Base

  belongs_to :campaign_list

  named_scope :active, :conditions => {:active => true}

  validates_presence_of :first_name, :last_name, :email, :want_to_subscribe
  validates_uniqueness_of :email, :message => I18n.t('newsletter_subscription.already_registered')
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => I18n.t('contact_form.invalid_email')

  def update_state
    subscriber = Campaigning::List.new(self.campaign_list.list_key,
                                       self.campaign_list.name,
                                       { :apiKey => self.campaign_list.campaign_monitor.api_key }).find_single_subscriber(self.email)
    self.active = subscriber.state == "Active" ?  true : false
    self.save
  rescue

  end

end
