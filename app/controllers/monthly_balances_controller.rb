class MonthlyBalancesController < ApplicationController
  # GET /monthly_balances
  # GET /monthly_balances.json
  def index
    @monthly_balances = MonthlyBalance.all

    render json: @monthly_balances
  end

  # GET /monthly_balances/1
  # GET /monthly_balances/1.json
  def show
    @monthly_balance = MonthlyBalance.find(params[:id])

    render json: @monthly_balance
  end

  # POST /monthly_balances
  # POST /monthly_balances.json
  def create
    @monthly_balance = MonthlyBalance.new(monthly_balance_params)

    if @monthly_balance.save
      render json: @monthly_balance, status: :created, location: @monthly_balance
    else
      render json: @monthly_balance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monthly_balances/1
  # PATCH/PUT /monthly_balances/1.json
  def update
    @monthly_balance = MonthlyBalance.find(params[:id])

    if @monthly_balance.update(monthly_balance_params)
      head :no_content
    else
      render json: @monthly_balance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monthly_balances/1
  # DELETE /monthly_balances/1.json
  def destroy
    @monthly_balance = MonthlyBalance.find(params[:id])
    @monthly_balance.destroy

    head :no_content
  end

  private

  def monthly_balance_params
    params.require(:monthly_balance).permit(:group_id, :account_title_id, :b_year, :b_month, :b_amount)
  end
end
