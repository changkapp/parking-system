class Admin < ActiveRecord::Base
	enum role: [:complete_access, :restrict_access]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	def role_br
 		if self.role == 'complete_access'
 			'Administrativo'
 		else
 			'Funcionário'
 		end
 	end
end
