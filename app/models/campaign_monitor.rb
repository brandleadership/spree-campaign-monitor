class CampaignMonitor < ActiveRecord::Base

  validates_presence_of :api_key, :name

  has_many :campaign_lists, :dependent => :delete_all

  #
  # Returns the form fields in the correct order
  #
  def self.form_fields
    [:name, :api_key, :client_key]
  end

  #
  # Gets the lists from defined api and client key 
  #
  def update_lists
    client = Campaigning::Client.new(self.client_key, self.name, {:apiKey => self.api_key})
    client.lists.each do |list|
      self.campaign_lists.create(:name => list.name, :list_key => list.listID) unless CampaignList.find(:first, :conditions => {:list_key => list.listID})
    end
  end

end
