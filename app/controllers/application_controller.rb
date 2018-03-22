class ApplicationController < ActionController::Base
  #Pundit
	include Pundit
	#Pundit manage errors
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #layout resource
  layout :layout_by_resource

  def pundit_user
  	current_admin
  end

  private

	def layout_by_resource
	  if devise_controller? && resource_name == :admin
	    "backoffice_devise"
	  else
	    "application"
	  end
	end

	def user_not_authorized
    flash[:alert] = "Você não possui autorização realizar esta ação."
    redirect_to(request.referrer || root_path)
  end
end
