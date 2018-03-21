class Backoffice::CashFlowsController < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice"

  def index
    @cash_flows = CashFlow.all
  end

  # GET /cash_flows/1
  # GET /cash_flows/1.json
  def show
  end

  # GET /cash_flows/new
  def new
    @cash_flow = CashFlow.new
  end

  # GET /cash_flows/1/edit
  def edit
    @cash_flow = CashFlow.find(params[:id])
  end

  # POST /cash_flows
  # POST /cash_flows.json
  def create
    @cash_flow = CashFlow.new(cash_flow_params)
    if @cash_flow.save
      redirect_to backoffice_cash_flows_path, notice: "Os dados do caixa foram cadastrados com sucesso."
    else
      render :new
    end
  end

  # PATCH/PUT /cash_flows/1
  # PATCH/PUT /cash_flows/1.json
  def update
    @cash_flow = CashFlow.find(params[:id])
    if @cash_flow.update(cash_flow_params)
      redirect_to backoffice_cash_flows_path, notice: "Os dados do caixa foram atualizados com sucesso."
    else
      render :edit
    end
  end

  # DELETE /cash_flows/1
  # DELETE /cash_flows/1.json
  def destroy
  	@cash_flow = CashFlow.find(params[:id])
  	if @cash_flow.present?
    	@cash_flow.destroy
		end
      redirect_to backoffice_cash_flows_path, notice: "Os dados do caixa foram deletados com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_flow
      @cash_flow = CashFlow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_flow_params
      params.require(:cash_flow).permit(:entry_cash, :cash_outflow)
    end
end
