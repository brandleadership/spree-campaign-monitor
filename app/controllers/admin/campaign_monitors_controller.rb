class Admin::CampaignMonitorsController < Admin::BaseController
  resource_controller

  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }

  create.after do
    initialize_campaign_monitor
  end

  update.after do
    initialize_campaign_monitor
  end

  private

  def initialize_campaign_monitor
    @campaign_monitor.update_components
    @campaign_monitor.campaign_lists.each do |list|
      list.update_subscribers
    end
  end

end
