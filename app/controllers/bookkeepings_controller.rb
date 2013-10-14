class BookkeepingsController < ApplicationController

  before_action :set_group, only: [:index, :create]
  before_action :set_bookkeeping, only: [:show, :update, :destroy]
  # GET /bookkeepings
  # GET /bookkeepings.json
  def index
    @bookkeepings = @group.bookkeepings.order(created_at: :desc)

    render json: @bookkeepings
  end

  # GET /bookkeepings/1
  # GET /bookkeepings/1.json
  def show

    render json: @bookkeeping
  end

  # POST /bookkeepings
  # POST /bookkeepings.json
  def create
    @bookkeeping = @group.bookkeepings.new(bookkeeping_params)

    if @bookkeeping.save
      render json: @bookkeeping, status: :created, location: @bookkeeping
    else
      render json: @bookkeeping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookkeepings/1
  # PATCH/PUT /bookkeepings/1.json
  def update

    if @bookkeeping.update(bookkeeping_params)
      head :no_content
    else
      render json: @bookkeeping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookkeepings/1
  # DELETE /bookkeepings/1.json
  def destroy
    @bookkeeping.destroy

    head :no_content
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_bookkeeping
    @group = Group.find(params[:group_id])
    @bookkeeping = @group.bookkeepings.find(params[:id])
  end

  def bookkeeping_params
    params.require(:bookkeeping).permit(:group_id, :issue_date, :issuer_id, :operator, :account_title_id, :remark, :amount, :content)
  end
end
