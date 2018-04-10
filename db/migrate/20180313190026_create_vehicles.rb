class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :color
      t.string :model
      t.string :email
      t.text :observations
      t.boolean :payment_status
      t.date :checkout_date
      t.jsonb :services, default: {}       

      t.timestamps null: false
    end
  end
end
