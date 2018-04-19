class Mensalist < ActiveRecord::Base
	belongs_to :park

	after_save :check_payment_status_and_update

	enum payment_status: {
    unpaid: 1,
    paid: 2
	}


	def check_tolerance_date
		tolerance_date = self.days_of_tolerance
		self.first_invoice_date = self.first_invoice_date + self.days_of_tolerance.days
	end

	def check_payment_status_and_update
		check_payment = self.payment_status

		if check_payment == "paid"
			old_invoice_date = self.check_tolerance_date
			invoice_date = old_invoice_date + 1.month
			self.first_invoice_date = invoice_date

			if old_invoice_date > invoice_date
				check_payment = "unpaid"
				self.payment_status = check_payment
			end
		end
	end
end

