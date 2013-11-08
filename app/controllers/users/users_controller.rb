class Users::UsersController < ApplicationController
  def index
    render json: User.all
  end	

  def search
  	render json: User.where("email LIKE ?", '%' + params[:search] + '%')  	
  end	

  def membered_groups
    render json: current_user.membered_groups
  end

  def like 

    @user = User.find(params[:id])
    @likeable = params[:likeable_type].classify.constantize.send('find', params[:likeable_id])
    @user.like! @likeable

    render json: @likeable

  end

  def dislike

    @user = User.find(params[:id])
    @likeable = params[:likeable_type].classify.constantize.send('find', params[:likeable_id])
    @user.dislike! @likeable

    render json: @likeable
  end

end
