require File.dirname(__FILE__) + '/../spec_helper'

describe NewsletterSubscription do
  before(:each) do
    @newsletter_subscription = NewsletterSubscription.create(:first_name => 'first name',
                                                             :last_name => 'last name',
                                                             :email => 'test@screenconcept.ch',
                                                             :want_to_subscribe => true)
  end

  it "should be valid" do
    @newsletter_subscription.should be_valid
  end
end
