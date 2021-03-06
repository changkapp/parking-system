class Backoffice::ServicesController < BackofficeController

  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to backoffice_services_path, notice: "O Serviço #{@service.name} foi cadastrado com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to backoffice_services_path, notice: "O Serviço #{@service.name} foi atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
  	@service = Service.find(params[:id])
  	if @service.present?
    	@service.destroy
		end
      redirect_to backoffice_services_path, notice: "O Serviço #{@service.name} foi deletado com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :price)
    end
end
