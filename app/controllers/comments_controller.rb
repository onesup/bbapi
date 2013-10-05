class CommentsController < ApplicationController

  def show
    @comment = comment.find(params[:id])
    render json: @comment
  end

  def create
    @commentable = comment_params[:commentable_type].classify.constantize.send('find',comment_params[:commentable_id])
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end    
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :writer_id, :commentable_id, :commentable_type)
  end  
end
