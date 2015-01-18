class UpvotesController < ApplicationController

  before_action :set_post
  before_action :authenticate_user!

  def create
    @upvote = Upvote.create(post: @post, user: current_user)
    if(downvote = current_user.downvotes.find_by_post_id(params[:post_id]))
      downvote.destroy!
    end

    update_vote_count

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy

    update_vote_count

    respond_to do |format|
      format.js
    end
  end

  private
  def update_vote_count
    @post.update_attribute(:votes_count, get_votes)
  end

  def get_votes
    @post.upvotes.count - @post.downvotes.count
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
