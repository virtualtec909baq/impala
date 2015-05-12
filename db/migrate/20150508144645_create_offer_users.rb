class CreateOfferUsers < ActiveRecord::Migration
  def change
    create_table :offer_users do |t|
      t.float :quantity
      t.float :price
      t.integer :offer_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
