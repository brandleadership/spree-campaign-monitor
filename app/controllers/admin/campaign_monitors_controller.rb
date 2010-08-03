class Admin::CampaignMonitorsController < Admin::BaseController
  resource_controller

  include Admin::CampaignMonitorsHelper

  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }

  create.after do
    initialize_campaign_monitor
  end

  update.after do
    initialize_campaign_monitor
  end

  def update_campaign_monitor
    initialize_campaign_monitor
  end

end
