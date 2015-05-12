class AddStatusToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :status, :integer, :default => 1
  end
end
