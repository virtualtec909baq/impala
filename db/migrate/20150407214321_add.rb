class Add < ActiveRecord::Migration
  def change
	add_column :offers, :observations, :text  
  end

end
