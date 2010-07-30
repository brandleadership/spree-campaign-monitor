require File.dirname(__FILE__) + '/../spec_helper'

describe NewsletterSubscription do
  before(:each) do
    @newsletter_subscription = NewsletterSubscription.new
  end

  it "should be valid" do
    @newsletter_subscription.should be_valid
  end
end
