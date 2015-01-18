class AddFavoritesAndCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :favorites_count, :integer, default: 0, null: false
    add_column :posts, :comments_count, :integer, default: 0, null: false
  end
end
