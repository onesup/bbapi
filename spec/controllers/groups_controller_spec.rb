# encoding: UTF-8

require 'spec_helper'

describe GroupsController do
  describe "GET #index 액션" do
    it ": @groups 변수에 모든 그룹 컬렉션을 할당함" do
      group1 = create(:group, name: "group1")
      group2 = create(:group, name: 'group2')
      get :index
      expect(assigns(:groups)).to match_array([group1, group2])
    end
  end

  describe "GET #show 액션" do
    it ": @group 변수에 특정 그룹 객체를 할당함" do
      group = create(:group)
      get :show, id: group
      expect(assigns(:group)).to eq group
    end
  end

  describe "POST #create 액션" do

    context '> 데이터가 유효한 경우' do
      it ": 새 그룹을 데이터베이스에 저장함." do
        expect{ 
          post :create, group: attributes_for(:group)
        }.to change(Group, :count).by(1)
      end
    end

    context '> 데이터가 유효하지 않은 경우' do
      it ': 새 그룹이 데이터베이스에 저장되지 않음' do
        expect{ 
          post :create, group: attributes_for(:invalid_group)
        }.to change(Group, :count).by(0)
      end
    end
  end

  describe "PATCH #update 액션" do
    before :each do 
      @group = create(:group, owner_id: 1, name: 'Group1', description: 'Group1 description')
    end
    context '> 데이터가 유효한 경우' do
      it ": 특정 그룹의 변경내용을 데이터베이스에 저장함" do
        patch :update, id: @group, group: attributes_for(:group)
        expect(assigns(:group)).to eq(@group)
      end
    end
    context '> 데이터가 유효하지 않은 경우' do
      it ': 특정 그룹의 변경내용을 데이터베이스에 저장하지 않음' do
        patch :update, id: @group, group: attributes_for(:group,
            owner_id: nil, name: "GroupX", description: nil)
        @group.reload
        expect(@group.name).to_not eq("GroupX")
        expect(@group.owner_id).to eq(1)
      end
    end
  end

  describe 'DELETE #destroy 액션' do
    before :each do 
      @group = create(:group)
    end
    it ': 특정 그룹을 데이터베이스에서 삭제함' do
      expect{
        delete :destroy, id: @group
      }.to change(Group, :count).by(-1)
    end
  end

  describe 'GET #list_members 액션' do
    it '* 가입된 멤버가 없는 경우 에러를 표시함'
    it "* 해당 그룹의 모든 멤버를 보여 줌" 
    
  end
end
