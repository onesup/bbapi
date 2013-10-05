require 'spec_helper'

describe CommentsController do

	before(:each) do
	  @income_category = FactoryGirl.create(:income_category)
	  @outlay_category = FactoryGirl.create(:outlay_category)
	  @income_item = FactoryGirl.create(:income_item)
	  @outlay_item = FactoryGirl.create(:outlay_item)	  
	end

  describe 'POST #create 액션' do

  	context '> 데이터가 유효한 경우' do
  		it ': 새 그룹을 데이터베이스에 저장함.' do
  			expect{ 
          post :create, comment: attributes_for(:comment)
        }.to change(Comment, :count).by(1)
      end
    end

    context '> 데이터가 유효하지 않은 경우' do
      it ': 새 그룹이 데이터베이스에 저장되지 않음' do
        expect{ 
          post :create, comment: attributes_for(:invalid_comment)
        }.to change(Comment, :count).by(0)
      end
    end

  end
end