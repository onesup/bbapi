require 'spec_helper'

describe CommentsController do

	before(:each) do
	  @income_category = FactoryGirl.create(:income_category)
	  @outlay_category = FactoryGirl.create(:outlay_category)
	  @income_item = FactoryGirl.create(:income_item)
	  @outlay_item = FactoryGirl.create(:outlay_item)	  
	end

  describe 'GET #show 액션' do      
    it ': @comment 변수에 특정 그룹 객체를 할당함' do
      comment = create(:comment)
      get :show, id: comment
      expect(assigns(:comment)).to eq comment
    end
  end	

  describe 'POST #create 액션' do

  	context '> 데이터가 유효한 경우' do
  		it ': 새 Comment를 데이터베이스에 저장함.' do
  			expect{ 
          post :create, comment: attributes_for(:comment)
        }.to change(Comment, :count).by(1)
      end
    end

    context '> 데이터가 유효하지 않은 경우' do
      it ': 새 Comment가 데이터베이스에 저장되지 않음' do
        expect{ 
          post :create, comment: attributes_for(:invalid_comment)
        }.to change(Comment, :count).by(0)
      end
    end
  end

  describe 'PATCH #update 액션' do    
    before :each do 
      @comment = create(:comment)
    end  	
    context '> 데이터가 유효한 경우' do
      it ': 특정 Comment의 변경내용을 데이터베이스에 저장함' do
        patch :update, id: @comment, comment: attributes_for(:comment)
        expect(assigns(:comment)).to eq(@comment)
      end
    end
    context '> 데이터가 유효하지 않은 경우' do
      it ': 특정 Comment의 변경내용을 데이터베이스에 저장하지 않음' do
        patch :update, id: @comment, comment: attributes_for(:comment,
            writer_id: nil, content: 'commentX', description: nil)
        @comment.reload
        expect(@comment.content).to_not eq('commentX')
        expect(@comment.writer_id).to eq(1)
      end
    end
  end

  describe 'DELETE #destroy 액션' do
    before :each do 
      @comment = create(:comment)
    end
    it ': 특정 Comment 데이터베이스에서 삭제함' do
      expect{
        delete :destroy, id: @comment
      }.to change(Comment, :count).by(-1)
    end
  end
end