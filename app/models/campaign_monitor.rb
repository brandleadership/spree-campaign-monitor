class CampaignMonitor < ActiveRecord::Base

  before_validation :active_to_inactive, :if => :active

  validates_uniqueness_of :active, :if => :active
  validates_presence_of :api_key, :name

  named_scope :active, :conditions => {:active => true}

  def self.form_fields
    [:name, :api_key, :client_id, :list_id, :active]
  end

  private

  #
  # Sets the active record to inactive
  #
  def active_to_inactive
    campaign = CampaignMonitor.find_by_active(true)
    if self != campaign and campaign != nil
      campaign.active = false
      campaign.save
    end
  end

end
