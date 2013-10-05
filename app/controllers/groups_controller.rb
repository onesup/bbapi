class GroupsController < ApplicationController

  before_action :set_group, except: [:index, :create]
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    render json: @group
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update

    if @group.update(group_params)
      head :no_content
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy

    head :no_content
  end


  # 멤버 추가하기
  def add
    user = User.find(params[:user_id])
    if @group.added?(user)
      render json: { success: 'failed', message: 'Already registered!' }
    else
      if @group.add! user
        render json: user, status: :added, location: @group
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end
  end

  # 멤버 삭제하기
  def remove
    user = @group.members.find(params[:user_id])
    @group.remove! user

    head :no_content
  end

  # 멤버리스트 보기
  def list_members
    @members = @group.members

    render json: @members
  end

private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:owner_id, :name, :description)
  end
  
end
