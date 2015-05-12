class AddFieldToOfferUsers < ActiveRecord::Migration
  def change
    add_column :offer_users, :status, :boolean, :default => false
  end
end
