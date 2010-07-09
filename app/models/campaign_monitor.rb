class CampaignMonitor < ActiveRecord::Base

  before_validation :active_to_inactive, :if => :active

  validates_uniqueness_of :active, :if => :active
  validates_presence_of :api_key, :name

  private

  #
  # Sets the active record to inactive
  #
  def active_to_inactive
    campaign = CampaignMonitor.find_by_active(true)
    campaign.active = false
    campaign.save
  end

end
