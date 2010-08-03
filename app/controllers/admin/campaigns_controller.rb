class Admin::CampaignsController < Admin::BaseController

  include Admin::CampaignMonitorsHelper

  def index
    @campaigns = Campaign.find(:all)
  end

  def invoke
    @campaign = Campaign.find(params[:id])
    @campaign.invoke
    render :nothing  => true
  end

  def update_campaign_monitor
    initialize_campaign_monitor
  end
  
end
