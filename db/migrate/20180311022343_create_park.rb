class CreatePark < ActiveRecord::Migration
  def up
  change_column :park, :some_column, :integer, after: :other_column
	end
  
  def change
		create_table :parks do |t|
			t.string :park_name
			t.string :park_location
			t.string :operating_hours
		end
	end
end
