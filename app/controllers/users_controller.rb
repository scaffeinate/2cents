class UsersController < ApplicationController
  before_action :set_user
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @posts = @user.posts.paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @user.update(user_params)
    @user.is_profile_complete = true
    @user.has_random_password = false
    if @user.save
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def favorites
    @favorites = @user.posts.joins(:favorites).paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def upvotes
    @upvotes = @user.posts.joins(:upvotes).paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def downvotes
    @downvotes = @user.posts.joins(:downvotes).paginate(page: params[:page]).order('created_at DESC')
    @categories = Category.order('posts_count DESC').limit(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation,
                                 :location, :avatar)
  end

  def check_user
    if @user != current_user
      redirect_to root_path
    end
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
