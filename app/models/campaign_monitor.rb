class CampaignMonitor < ActiveRecord::Base

  validates_presence_of :api_key, :name

  def self.form_fields
    [:name, :api_key, :client_id]
  end

end
