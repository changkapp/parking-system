class Backoffice::MensalistsController < BackofficeController
  skip_before_action :authenticate_admin!, only: :show

  def index
    @mensalists = Mensalist.all
  end

  # GET /mensalists/1
  # GET /mensalists/1.json
  def show
    @mensalist = Mensalist.find(params[:id])
    @services = Service.select(:id, :price, :name)

    @selected_services = @mensalist.services.map{ |e| 
      JSON.parse(e).with_indifferent_access 
    }
    
    @selected_services_ids = @selected_services.map{ |e| e["id"] }
    render layout: "application"
  end

  # GET /mensalists/new
  def new
    @mensalist = Mensalist.new
    @services = Service.select(:id, :price, :name)

    @selected_services = @mensalist.services.map{ |e| 
      JSON.parse(e).with_indifferent_access 
    }

    @selected_services_ids = @selected_services.map{ |e| e["id"] } 
  end

  # GET /mensalists/1/edit
  def edit
    @mensalist = Mensalist.find(params[:id])
    @services = Service.select(:id, :price, :name)

    @selected_services = @mensalist.services.map{ |e| 
      JSON.parse(e).with_indifferent_access 
    }
    
    @selected_services_ids = @selected_services.map{ |e| e["id"] } 
  end

  # POST /mensalists
  # POST /mensalists.json
  def create
    @mensalist = Mensalist.new(mensalist_params)
    mensalist_params[:services] = Hash.new(mensalist_params[:services])
    if @mensalist.save
      redirect_to backoffice_mensalists_path, notice: "O Mensalista #{@mensalist.name} foi cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /mensalists/1
  # PATCH/PUT /mensalists/1.json
  def update
    @mensalist = Mensalist.find(params[:id])
    if @mensalist.update(mensalist_params)
      redirect_to backoffice_mensalists_path, notice: "O Mensalista #{@mensalist.name} foi atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /mensalists/1
  # DELETE /mensalists/1.json
  def destroy
  	@mensalist = Mensalist.find(params[:id])
  	if @mensalist.present?
    	@mensalist.destroy
  	end
      redirect_to backoffice_mensalists_path, notice: "O Mensalista #{@mensalist.name} foi deletado com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensalist
      @mensalist = Mensalist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensalist_params
      params.require(:mensalist).permit(:name, :email, :price, :park_id, :days_of_tolerance, :past_invoice_date,:first_invoice_date, :plates, :car_seat_numbers, :payment_status, :services => [])
    end
end
