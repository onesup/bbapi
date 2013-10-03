class OutlayItemsController < ApplicationController
  # GET /outlay_items
  # GET /outlay_items.json
  def index
    @outlay_items = OutlayItem.all

    render json: @outlay_items
  end

  # GET /outlay_items/1
  # GET /outlay_items/1.json
  def show
    @outlay_item = OutlayItem.find(params[:id])

    render json: @outlay_item
  end

  # POST /outlay_items
  # POST /outlay_items.json
  def create
    @outlay_item = OutlayItem.new(outlay_item_params)

    if @outlay_item.save
      render json: @outlay_item, status: :created, location: @outlay_item
    else
      render json: @outlay_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outlay_items/1
  # PATCH/PUT /outlay_items/1.json
  def update
    @outlay_item = OutlayItem.find(params[:id])

    if @outlay_item.update(outlay_item_params)
      head :no_content
    else
      render json: @outlay_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outlay_items/1
  # DELETE /outlay_items/1.json
  def destroy
    @outlay_item = OutlayItem.find(params[:id])
    @outlay_item.destroy

    head :no_content
  end

  private

  def outlay_item_params
    params.require(:outlay_item).permit(:category_id, :owner_id, :content, :amount, :issue_date)
  end
end
