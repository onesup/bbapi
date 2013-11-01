class AccountTitlesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_account_title, except: [:index, :create]

  # GET /account_titles
  # GET /account_titles.json
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

  # GET /account_titles/1
  # GET /account_titles/1.json
  def show

    render json: @account_title
  end

  # POST /account_titles
  # POST /account_titles.json
  def create
    @account_title = AccountTitle.new(account_title_params)
    @account_title.owner = current_user

    if @account_title.save
      render json: @account_title, status: :created, location: @account_title
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account_titles/1
  # PATCH/PUT /account_titles/1.json
  def update


    if @account_title.update(account_title_params)
      head :no_content
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  # DELETE /account_titles/1
  # DELETE /account_titles/1.json
  def destroy
    @account_title.destroy

    head :no_content
  end

  private
  def set_account_title
    @account_title = AccountTitle.find(params[:id])
  end

  def account_title_params
    params.require(:account_title).permit(:account_category_id, :title)
  end
end
