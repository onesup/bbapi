class OutlayCategoriesController < ApplicationController
  # GET /outlay_categories
  # GET /outlay_categories.json
  def index
    @outlay_categories = OutlayCategory.all

    render json: @outlay_categories
  end

  # GET /outlay_categories/1
  # GET /outlay_categories/1.json
  def show
    @outlay_category = OutlayCategory.find(params[:id])

    render json: @outlay_category
  end

  # POST /outlay_categories
  # POST /outlay_categories.json
  def create
    @outlay_category = OutlayCategory.new(outlay_category_params)

    if @outlay_category.save
      render json: @outlay_category, status: :created, location: @outlay_category
    else
      render json: @outlay_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outlay_categories/1
  # PATCH/PUT /outlay_categories/1.json
  def update
    @outlay_category = OutlayCategory.find(params[:id])

    if @outlay_category.update(outlay_category_params)
      head :no_content
    else
      render json: @outlay_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outlay_categories/1
  # DELETE /outlay_categories/1.json
  def destroy
    @outlay_category = OutlayCategory.find(params[:id])
    @outlay_category.destroy

    head :no_content
  end

  private

  def outlay_category_params
    params.require(:outlay_category).permit(:owner_id, :name, :description)
  end
  
end
