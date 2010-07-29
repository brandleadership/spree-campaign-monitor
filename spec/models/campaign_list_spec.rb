require File.dirname(__FILE__) + '/../spec_helper'

describe CampaignList do
  before(:each) do
    @campaign_list = CampaignList.new
  end

  it "should be valid" do
    @campaign_list.should be_valid
  end
end
