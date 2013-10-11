class AccountCategoriesController < ApplicationController

  # Strong parameters
  before_action :set_account_category, except: [:index, :create]

  # GET /account_categories
  # GET /account_categories.json
  def index
    @account_categories = AccountCategory.all

    render json: @account_categories
  end

  # GET /account_categories/1
  # GET /account_categories/1.json
  def show

    render json: @account_category
  end

  # POST /account_categories
  # POST /account_categories.json
  def create
    @account_category = AccountCategory.new(account_category_params)

    if @account_category.save
      render json: @account_category, status: :created, location: @account_category
    else
      render json: @account_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account_categories/1
  # PATCH/PUT /account_categories/1.json
  def update

    if @account_category.update(account_category_params)
      head :no_content
    else
      render json: @account_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /account_categories/1
  # DELETE /account_categories/1.json
  def destroy

    @account_category.destroy

    head :no_content
  end

  private

  def set_account_category
    @account_category = AccountCategory.find(params[:id])
  end

  def account_category_params
    params.require(:account_category).permit(:name)
  end
end
