class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.where(location: current_user.location).paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def popular
    @posts = Post.where(location: current_user.location).paginate(page: params[:page]).order('votes_count DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def trending
    @posts = Post.where(location: current_user.location).paginate(page: params[:page]).order('votes_count DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def categories
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.html
      format.js
    end
  end

end
