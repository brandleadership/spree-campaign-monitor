class Admin::CampaignListsController < Admin::BaseController

    def index
      @campaign_monitor ||= CampaignMonitor.find(:first)
      client = Campaigning::Client.new(@campaign_monitor.client_id, nil, {:apiKey => @campaign_monitor.api_key})
      @campaign_lists = client.lists
    end

end
