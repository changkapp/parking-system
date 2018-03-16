class CreateMensalists < ActiveRecord::Migration
  def change
    create_table :mensalists do |t|
      t.string :name
      t.string :email
      t.float :price
      t.integer :days_of_tolerance
      t.date :first_invoice_date
      t.string :plates
      t.integer :car_seat_numbers

      t.timestamps null: false
    end
  end
end