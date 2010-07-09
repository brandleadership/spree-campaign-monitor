class CreateNewsletterSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :newsletter_subscriptions do |t|
      t.boolean :want_to_subscribe
      t.string :first_name, :last_name, :email, :null => false
      t.string :company
      t.string :address
      t.string :post_code, :city
      t.string :phone, :fax
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_subscriptions
  end
end
