require File.dirname(__FILE__) + '/../spec_helper'

describe Campaign do
  before(:each) do
    @campaign = Campaign.new
  end

  it "should be valid" do
    @campaign.should be_valid
  end
end
