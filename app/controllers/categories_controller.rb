class CategoriesController < ApplicationController
  autocomplete :category, :name

  def create
    @category = Category.new(name: params[:category][:name], user: current_user)
    if @category.save
      render json: @category
    end
  end

end
