 map.namespace :admin do |admin|
   admin.resources :campaign_monitors
   admin.resources :newsletter_subscriptions
   admin.download_as_csv '/admin/newsletter_subscriptions/download' , :controller =>'newsletter_subscriptions', :action => 'download_as_csv'
 end
