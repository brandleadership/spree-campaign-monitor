require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::NewsletterSubscriptionsHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the Admin::NewsletterSubscriptionsHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(Admin::NewsletterSubscriptionsHelper)
  end
  
end
