class AccountTitlesController < ApplicationController
  # GET /account_titles
  # GET /account_titles.json
  def index
    @account_titles = AccountTitle.all

    render json: @account_titles
  end

  # GET /account_titles/1
  # GET /account_titles/1.json
  def show
    @account_title = AccountTitle.find(params[:id])

    render json: @account_title
  end

  # POST /account_titles
  # POST /account_titles.json
  def create
    @account_title = AccountTitle.new(params[:account_title])

    if @account_title.save
      render json: @account_title, status: :created, location: @account_title
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account_titles/1
  # PATCH/PUT /account_titles/1.json
  def update
    @account_title = AccountTitle.find(params[:id])

    if @account_title.update(params[:account_title])
      head :no_content
    else
      render json: @account_title.errors, status: :unprocessable_entity
    end
  end

  # DELETE /account_titles/1
  # DELETE /account_titles/1.json
  def destroy
    @account_title = AccountTitle.find(params[:id])
    @account_title.destroy

    head :no_content
  end
end
