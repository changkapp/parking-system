class HomeController < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice"
  
  def index
  end
end
