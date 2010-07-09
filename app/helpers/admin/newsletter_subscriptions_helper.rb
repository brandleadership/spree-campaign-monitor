module Admin::NewsletterSubscriptionsHelper

  #
  # Creates link how toggles the active state
  #
  def toggle_link(object, action)
    link_to_remote icon(action), :url => { :action => "toggle_active", :id => object.id }, :complete => "$('#newsletter_subscriptions_entry_#{object.id} .active').empty();$('#newsletter_subscriptions_entry_#{object.id} .active').append('#{(action == :add ? 'false' : 'true')}');$('#newsletter_subscriptions_entry_#{object.id} .toggle .#{(action == :add ? 'delete' : 'add')}').show();"
  end
  
end