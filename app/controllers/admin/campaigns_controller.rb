class Admin::CampaignsController < Admin::BaseController

  def index
    @campaigns = Campaign.find(:all)
  end
  
end
