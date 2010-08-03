require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::CampaignsController do
  integrate_views
  fixtures :campaigns

  #Delete this example and add some real ones
  it "should use Admin::CampaignCampaignsController" do
    controller.should be_an_instance_of(Admin::CampaignsController)
  end

  it "should show list with index" do
    get :index
    response.should render_template("index")
  end

end
