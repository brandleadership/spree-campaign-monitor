class CampaignMonitor < ActiveRecord::Base

  has_many :campaign_lists, :dependent => :delete_all
  has_many :campaigns, :dependent => :delete_all

  validates_presence_of :api_key, :name, :client_key

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
    client.campaigns.each do |campaign|
      self.campaigns.create(:campaign_key => campaign.campaignID,
                           :subject => campaign.subject,
                           :name => campaign.name,
                           :sent_date => campaign.sentDate,
                           :total_recipients => campaign.totalRecipients) unless Campaign.find(:first, :conditions => { :campaign_key => campaign.campaignID })
    end
  end

end
