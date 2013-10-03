class IncomeItemsController < ApplicationController
  # GET /income_items
  # GET /income_items.json
  def index
    @income_items = IncomeItem.all

    render json: @income_items
  end

  # GET /income_items/1
  # GET /income_items/1.json
  def show
    @income_item = IncomeItem.find(params[:id])

    render json: @income_item
  end

  # POST /income_items
  # POST /income_items.json
  def create
    @income_item = IncomeItem.new(income_item_params)

    if @income_item.save
      render json: @income_item, status: :created, location: @income_item
    else
      render json: @income_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /income_items/1
  # PATCH/PUT /income_items/1.json
  def update
    @income_item = IncomeItem.find(params[:id])

    if @income_item.update(income_item_params)
      head :no_content
    else
      render json: @income_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /income_items/1
  # DELETE /income_items/1.json
  def destroy
    @income_item = IncomeItem.find(params[:id])
    @income_item.destroy

    head :no_content
  end

  private

  def income_item_params
    params.require(:income_item).permit(:category_id, :owner_id, :content, :amount, :issue_date)
  end
end
