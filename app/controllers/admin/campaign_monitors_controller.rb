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
    @campaign_monitor ||= CampaignMonitor.find(params[:id])
    @campaign_monitor.update_components
    @campaign_monitor.campaign_lists.each do |list|
      list.update_subscribers
    end

    redirect :back
  end

end
