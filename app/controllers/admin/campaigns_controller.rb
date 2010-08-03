class Admin::CampaignsController < Admin::BaseController

  def index
    @campaigns = Campaign.find(:all)
  end

  def invoke
    @campaign = Campaign.find(params[:id])
    @campaign.invoke
    render :nothing  => true
  end
  
end
