class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    comment = Comment.find(params[:id])
    @comments = ChildComments.new(comment).comment_with_replies
    render json: @comments
  end

  def create
    Comment.create(parent_id: params[:parent_id], body: params[:body], like_count: 0, user_id: session[:user_id])
    render json: "Comment successfully created"
  end

  def destroy
    @comments = Comment.find(params[:id])
    @comments.destroy
    render json: { message: "comments #{params[:id]} successfully destroyed" }
  end

  def user_comments
    @comments = Comment.where(user_id: current_user.id)
    render json: @comments
  end
end
