class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :color
      t.string :model
      t.string :email
      t.text :observations
      t.float :total_to_pay
      t.integer :permanence_type, default: 1
      t.integer :payment_status, default: 1
      t.date :checkout_date
      t.jsonb :services, default: {} 

      t.references :park, index: true, foreign_key: true      

      t.timestamps null: false
    end
  end
end
