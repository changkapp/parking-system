class AdminPolicy < ApplicationPolicy
  
	def new?
		user.complete_access?
	end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
