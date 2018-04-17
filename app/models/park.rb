class Park < ActiveRecord::Base
	has_many :vehicles
  has_many :mensalists
end
