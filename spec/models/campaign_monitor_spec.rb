require File.dirname(__FILE__) + '/../spec_helper'

describe CampaignMonitor do
  before(:each) do
    @campaign_monitor = CampaignMonitor.new
  end

  it "should be valid" do
    @campaign_monitor.should be_valid
  end
end
