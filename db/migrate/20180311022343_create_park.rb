class CreatePark < ActiveRecord::Migration
	def change
		create_table :parks do |t|
			t.string :park_name
			t.string :park_location
			t.string :operating_hours
		end
	end
end
