class Vehicle < ActiveRecord::Base
	belongs_to :park

	enum payment_status: {
    unpaid: 1,
    paid: 2
	}

	enum permanence_type: {
    rotative: 1,
    futebol: 2,
    daily: 3
	}

	def check_hour_result
		created_date_hour = self.created_at.strftime('%H').to_i
		updated_date_hour = self.updated_at.strftime('%H').to_i
		updated_date_hour - created_date_hour 
	end

	def check_min_result
		created_date_min = self.created_at.strftime('%M').to_i
		updated_date_min = self.updated_at.strftime('%M').to_i
		updated_date_min - created_date_min
	end

	def calculate_time_to_invoice
		calculate_mins = ((60 * check_hour_result) + check_min_result) / 30
		check_reminder = ((60 * check_hour_result) + check_min_result) % 30

		if check_reminder != 0
			calculate_mins += 1 
		end
	end

	def calculate_invoice
		if permanence_type == "rotative"
			self.total_to_pay = calculate_time_to_invoice * 2.5
		elsif permanence_type == "futebol"
			self.total_to_pay = calculate_time_to_invoice * 1.5
		else
			self.total_to_pay = calculate_time_to_invoice * 15
		end 
	end
end
