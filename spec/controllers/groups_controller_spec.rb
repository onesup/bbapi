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
    it ": 새 그룹을 데이터베이스에 저장함." do
      expect{ 
        post :create, group: attributes_for(:group, group_attributes: build(:group))
      }.to change(Group, :count).by(1)
    end
  end

  describe "PATCH #update 액션" do
    before :each do 
      @group = create(:group)
    end
    it ": 특정 그룹의 변경내용을 데이터베이스에 저장함" do
      patch :update, id: @group, group: attributes_for(:group)
      expect(assigns(:group)).to eq(@group)
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

end
