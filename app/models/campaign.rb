class Campaign < ActiveRecord::Base

  belongs_to :campaign_monitor

  def invoke
    response = Campaigning::Campaign.new(self.campaign_key,
                                         self.subject,
                                         self.name,
                                         self.sent_date,
                                         self.total_recipients,
                                         { :apiKey => self.campaign_monitor.api_key }).send!({ :confirmationEmail => 'rs@screenconcept.ch',
                                                                                               :sendDate => "Immediately"})

    response

  catch RuntimeError
    
  end

end
