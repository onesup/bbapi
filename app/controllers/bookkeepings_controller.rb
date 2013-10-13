class BookkeepingsController < ApplicationController
  # GET /bookkeepings
  # GET /bookkeepings.json
  def index
    @bookkeepings = Bookkeeping.all

    render json: @bookkeepings
  end

  # GET /bookkeepings/1
  # GET /bookkeepings/1.json
  def show
    @bookkeeping = Bookkeeping.find(params[:id])

    render json: @bookkeeping
  end

  # POST /bookkeepings
  # POST /bookkeepings.json
  def create
    @bookkeeping = Bookkeeping.new(bookkeeping_params)

    if @bookkeeping.save
      render json: @bookkeeping, status: :created, location: @bookkeeping
    else
      render json: @bookkeeping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookkeepings/1
  # PATCH/PUT /bookkeepings/1.json
  def update
    @bookkeeping = Bookkeeping.find(params[:id])

    if @bookkeeping.update(bookkeeping_params)
      head :no_content
    else
      render json: @bookkeeping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookkeepings/1
  # DELETE /bookkeepings/1.json
  def destroy
    @bookkeeping = Bookkeeping.find(params[:id])
    @bookkeeping.destroy

    head :no_content
  end

  private

  def bookkeeping_params
    params.require(:bookkeeping).permit(:issue_date, :issuer_id, :operator, :account_title_id, :remark, :amount)
  end
end
