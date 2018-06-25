class Mensalist < ActiveRecord::Base
	belongs_to :park

	after_save :check_payment_status_and_update
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
      old_invoice_date = self.check_tolerance_date
      old_date = self.first_invoice_date
      invoice_date = old_date + 1.month
      self.update_columns(first_invoice_date: invoice_date, payment_status: 1, days_of_tolerance: 0)
      
      if old_date > invoice_date
        self.update_column(payment_status: 3)
      end
    end
  end

  def mensalist_receipt_date
    self.first_invoice_date - 1.month
  end
end