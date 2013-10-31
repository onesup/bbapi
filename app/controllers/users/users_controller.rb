class Users::UsersController < ApplicationController
  def index
    render json: User.all
  end	

  def search
  	render json: User.where("email LIKE ?", '%' + params[:search] + '%')  	
  end	
end
