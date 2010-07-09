require 'fastercsv'

class Admin::NewsletterSubscriptionsController < Admin::BaseController
  resource_controller

  def index
    @newsletter_subscriptions = NewsletterSubscription.find(:all)
  end

  def toggle_active
    @newsletter_subscription = NewsletterSubscription.find(params[:id])
    if @newsletter_subscription.active
      @newsletter_subscription.active = false
    else
      @newsletter_subscription.active = true
    end
    @newsletter_subscription.save
    render :nothing  => true
  end

  def download_as_csv
    @newsletter_subscriptions = NewsletterSubscription.find(:all)
    @outfile = "newsletter_subscriptions_" + Time.now.strftime("%Y-%m-%d") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["First name", "Last name", "Email", "Company", "Address", "Post code", "City", "Phone", "Fax"]
      @newsletter_subscriptions.each do |entry|
        csv << [entry.first_name, entry.last_name, entry.email, entry.company, entry.address, entry.post_code, entry.city, entry.phone, entry.fax]
      end
    end
    send_data csv_data, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=#{@outfile}"   
  end

end
