class Backoffice::ParksController < BackofficeController
  
  def index
    @parks = Park.all
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
  end

  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
    @park = Park.find(params[:id])
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to backoffice_parks_path, notice: "estacionamentos cadastrados com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      redirect_to backoffice_parks_path, notice: "Os dados do estacionamento foram atualizados com sucesso."
    else
      render :edit
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
  	@park = Park.find(params[:id])
  	if @park.present?
    	@park.destroy
		end
      redirect_to backoffice_parks_path, notice: "Os dados do estacionamento foram deletados com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      params.require(:park).permit(:park_name, :park_location, :operating_hours, :park_cnpj)
    end
end
