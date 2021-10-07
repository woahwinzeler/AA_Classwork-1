class CommentsController < ApplicationController
  def create
    # debugger
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  def index
    render json: Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:artwork_id, :user_id, :body)
  end
end
