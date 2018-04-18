class CreateMensalists < ActiveRecord::Migration
  def change
    create_table :mensalists do |t|
      t.string :name
      t.string :email
      t.float :price
      t.integer :days_of_tolerance
      t.datetime :first_invoice_date
      t.datetime :invoice_date
      t.string :plates
      t.integer :car_seat_numbers
      t.integer :payment_status, default: 1
      t.jsonb :services, default: {}

      t.references :park, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end