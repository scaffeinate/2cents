class UsersController < ApplicationController
  before_action :set_user
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @posts = @user.posts.paginate(page: params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
  end

  def favorites
    @favorites = @user.posts.joins(:favorites).paginate(page: params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js
      format.html
    end
  end

  def upvotes
    @upvotes = @user.posts.joins(:upvotes).paginate(page: params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js
      format.html
    end
  end

  def downvotes
    @downvotes = @user.posts.joins(:downvotes).paginate(page: params[:page]).order('created_at DESC')
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password,
                                 :about, :location, :website, :avatar, :cover)
  end

  def check_user
    if @user != current_user
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
