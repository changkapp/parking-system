class Mensalist < ActiveRecord::Base
	belongs_to :park

	after_save :check_tolerance_date

	enum payment_status: {
    unpaid: 1,
    paid: 2,
    debtor: 3
	}


	def check_tolerance_date
		tolerance_date = self.days_of_tolerance
		add_days = self.first_invoice_date + tolerance_date.days
		self.update_column(:first_invoice_date, add_days) 
	end

	def check_payment_status_and_update
		check_payment = self.payment_status

		if check_payment == "paid"
			self.check_tolerance_date
			
			if self.past_invoice_date == nil || self.past_invoice_date == ""
				self.update_columns(past_invoice_date: Time.now)

				new_invoice_date = self.first_invoice_date + 1.month
				self.update_columns(days_of_tolerance: 0, first_invoice_date: new_invoice_date)
				

				if past_invoice_date == new_invoice_date || past_invoice_date > new_invoice_date
					self.update_columns(payment_status: 1)
				end
			end
		end
		return self.first_invoice_date
	end

	def mensalist_receipt_date
		self.first_invoice_date - 1.month
	end
end