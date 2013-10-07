class AccountCategoriesController < ApplicationController
  # GET /account_categories
  # GET /account_categories.json
  def index
    @account_categories = AccountCategory.all

    render json: @account_categories
  end

  # GET /account_categories/1
  # GET /account_categories/1.json
  def show
    @account_category = AccountCategory.find(params[:id])

    render json: @account_category
  end

  # POST /account_categories
  # POST /account_categories.json
  def create
    @account_category = AccountCategory.new(params[:account_category])

    if @account_category.save
      render json: @account_category, status: :created, location: @account_category
    else
      render json: @account_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account_categories/1
  # PATCH/PUT /account_categories/1.json
  def update
    @account_category = AccountCategory.find(params[:id])

    if @account_category.update(params[:account_category])
      head :no_content
    else
      render json: @account_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /account_categories/1
  # DELETE /account_categories/1.json
  def destroy
    @account_category = AccountCategory.find(params[:id])
    @account_category.destroy

    head :no_content
  end
end
