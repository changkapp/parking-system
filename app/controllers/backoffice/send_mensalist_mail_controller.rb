class Backoffice::SendMensalistMailController < ApplicationController
  def edit
    @mensalist = Mensalist.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @id = params[:id]
    begin
      AdminMailer.send_message(current_admin, params[:'recipient-name'], params[:'subject-text'] , params[:'message-text']).deliver_now
    rescue 
      puts "DEU RUIM"
    end
    
    respond_to do |format|
      format.js
    end
  end
end
