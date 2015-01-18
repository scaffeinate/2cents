class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
