class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :ref
      t.string :name
      t.text :details

      t.timestamps null: false
    end
  end
end
