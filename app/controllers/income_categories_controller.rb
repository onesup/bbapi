class IncomeCategoriesController < ApplicationController
  # GET /income_categories
  # GET /income_categories.json
  def index
    @income_categories = IncomeCategory.all

    render json: @income_categories
  end

  # GET /income_categories/1
  # GET /income_categories/1.json
  def show
    @income_category = IncomeCategory.find(params[:id])

    render json: @income_category
  end

  # POST /income_categories
  # POST /income_categories.json
  def create
    @income_category = IncomeCategory.new(income_category_params)

    if @income_category.save
      render json: @income_category, status: :created, location: @income_category
    else
      render json: @income_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /income_categories/1
  # PATCH/PUT /income_categories/1.json
  def update
    @income_category = IncomeCategory.find(params[:id])

    if @income_category.update(income_category_params)
      head :no_content
    else
      render json: @income_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /income_categories/1
  # DELETE /income_categories/1.json
  def destroy
    @income_category = IncomeCategory.find(params[:id])
    @income_category.destroy

    head :no_content
  end

  private

  def income_category_params
    params.require(:income_category).permit(:owner_id, :name, :description)
  end
  
end
