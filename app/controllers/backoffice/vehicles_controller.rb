class Backoffice::VehiclesController < BackofficeController
  
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @vehicle = Vehicle.find(params[:id])

    @services = Service.select(:id, :price, :name)

    @selected_services = @vehicle.services.map{ |e| 
      JSON.parse(e).with_indifferent_access 
    }

    @selected_services_ids = @selected_services.map{ |e| e["id"] }
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @services = Service.select(:id, :price, :name)

    @selected_services = @vehicle.services.map{ |e| 
      JSON.parse(e).with_indifferent_access 
    }

    @selected_services_ids = @selected_services.map{ |e| e["id"] }   
  end

  # GET /vehicles/1/edit
  def edit
    @services = Service.select(:id, :price, :name)    
    @vehicle = Vehicle.find(params[:id])
  
    @selected_services = @vehicle.services.map{ |e| 
      JSON.parse(e).with_indifferent_access 
    }

    @selected_services_ids = @selected_services.map{ |e| e["id"] }

  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    vehicle_params[:services] = Hash.new(vehicle_params[:services])
    if @vehicle.save
      redirect_to backoffice_vehicles_path, notice: "O Veículo #{@vehicle.plate} foi cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to backoffice_vehicles_path, notice: "O Veículo #{@vehicle.plate} foi atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
  	@vehicle = Vehicle.find(params[:id])
  	if @vehicle.present?
    	@vehicle.destroy
		end
      redirect_to backoffice_vehicles_path, notice: "O Veículo #{@vehicle.plate} foi deletado com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:plate, :park_id, :total_to_pay, :permanence_type,:color , :model, :email, :observations, :payment_status, :services => [])
    end
end
