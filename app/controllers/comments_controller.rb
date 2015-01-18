class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create do |comment|
      comment.content = params[:content]
      comment.user = current_user
    end

    respond_to do |format|
      format.js
    end

  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.update(comment_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment_id = params[:id]
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
