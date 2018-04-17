class Backoffice::AdminsController < BackofficeController
  
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
    authorize @admin
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador cadastrados com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: "Os dados do administrador foram atualizados com sucesso."
    else
      render :edit
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
  	@admin = Admin.find(params[:id])
  	if @admin.present?
    	@admin.destroy
		end
      redirect_to backoffice_admins_path, notice: "Os dados do administrador foram deletados com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :name, :role)
    end
end
