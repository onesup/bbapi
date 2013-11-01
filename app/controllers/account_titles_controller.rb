class AccountTitlesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_account_title, except: [:index, :create]

  # GET /groups/:group_id/account_titles
  # GET /groups/:group_id/account_titles.json
  def index
    @group = Group.find(params[:group_id])
    
    @ret = []
    AccountCategory.all.each do |category|
      @ret << {
        category:category.name,
        titles:@group.account_titles.where(account_category:category)
      }
    end
    # 지출

    # 수입
    render json: @ret
  end

  # GET /groups/:group_id/account_titles/1
  # GET /groups/:group_id/account_titles/1.json
  def show
    render json: @account_title
  end

  # POST /groups/:group_id/account_titles
  # POST /groups/:group_id/account_titles.json
  def create
    @account_title = AccountTitle.new(account_title_params)

    if @account_title.save
      render json: @account_title
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/:group_id/account_titles/1
  # PATCH/PUT /groups/:group_id/account_titles/1.json
  def update
    if @account_title.update(account_title_params)
      render json: @account_title
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/:group_id/account_titles/1
  # DELETE /groups/:group_id/account_titles/1.json
  def destroy
    if @account_title.destroy
      render json: true
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  private
  def set_account_title
    @account_title = AccountTitle.find(params[:id])
  end

  def account_title_params
    params.require(:account_title).permit(:account_category_id, :group_id, :title)
  end
end
