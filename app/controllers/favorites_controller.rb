class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @favorite = Favorite.create(post_id: params[:post_id], user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.js
    end
  end

end
