module Admin::CampaignMonitorsHelper

  #
  # True when campaign monitor is defined
  #
  def defined_campaign_monitor
    CampaignMonitor.find(:first) ? true : false
  end

  private

  def initialize_campaign_monitor
    @campaign_monitor.update_components
    @campaign_monitor.campaign_lists.each do |list|
      list.update_subscribers
    end
  end

end
