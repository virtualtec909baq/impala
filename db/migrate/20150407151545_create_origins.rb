class CreateOrigins < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :origins
      t.string :destination
      t.string :product
      t.float :volumen
      t.date :service_start_date
      t.date :service_finish_date
      t.date :offer_start_date
      t.date :offer_finish_date
      t.boolean :liquid_load
      t.boolean :container
      t.boolean :general_load
      t.boolean :load_compensation
      t.string :kind
      t.string :unit
      t.float :price

      t.timestamps null: false
    end
  end
end
