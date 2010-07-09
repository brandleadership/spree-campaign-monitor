# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'
require 'campaigning'

class CampaignMonitorExtension < Spree::Extension
  version "1.0"
  description "Spree extension for campaign monitor"
  url "http://github.com/screenconcept/spree-extension-campaign-monitor"

  # Please use campaign_monitor/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    AppConfiguration.class_eval do
      preference :campaign_monitor_api, :string, :default => ""
    end
    
  end
end
