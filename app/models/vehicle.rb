class Vehicle < ActiveRecord::Base
	belongs_to :park

	enum payment_status: {
    unpaid: 1,
    paid: 2
  }

end
