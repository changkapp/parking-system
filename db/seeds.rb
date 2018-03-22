# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



puts "Creating Services..."
	Service.find_or_create_by(name: "Lava Jato", price: 27.50)
	Service.find_or_create_by(name: "Futebol", price: 5.50)
	Service.find_or_create_by(name: "Diária", price: 17.00)
puts "Services created."


puts "Creating CashFlows ..."
	CashFlow.find_or_create_by(entry_cash: 60.21, cash_outflow: 32.21)
	CashFlow.find_or_create_by(entry_cash: 6.00, cash_outflow: 5.00)
puts "CashFlows created."  


puts "Creating Vehicles ..."
 	Vehicle.find_or_create_by(plate: "KPJ-4421", color: "Preto", model: "Toyota Corolla", email: "email1@email.com", observations: "carro com amassados do lado direto")
 	Vehicle.find_or_create_by(plate: "YGJ-1234", color: "Azul", model: "Rolls Royce Phanton", email: "email2@email.com", observations: "NOTHING!!")
 	Vehicle.find_or_create_by(plate: "HAV-6969", color: "Amarelo", model: "Fiat Toro", email: "email3@email.com", observations: "")
puts "Vehicles created."   


puts "Creating Mensalists ..."
	Mensalist.find_or_create_by(name: "André Chang", email:"chang123@gmail.com", price: 15.50, days_of_tolerance: 4, first_invoice_date: "10/02/2017", plates: "KYN-3322, EHR-5354", car_seat_numbers: 2)
puts "Mensalists created."


puts "Creating Admin ..."
	Admin.create!({:name => "André Chang", :email => "chang@admin.com", :role => 0, :password => "chang1234", :password_confirmation => "chang1234" })
	Admin.create!({:name => "Diego", :email => "diego@admin.com", :role => 1, :password => "diego1234", :password_confirmation => "diego1234" })
puts "Admin created."