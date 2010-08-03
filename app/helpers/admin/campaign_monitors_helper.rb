module Admin::CampaignMonitorsHelper

  #
  # True when campaign monitor is defined
  #
  def defined_campaign_monitor
    CampaignMonitor.find(:first) ? true : false
  end

end
