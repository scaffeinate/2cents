class AddPostsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer, default: 0, null: false
    change_column :users, :favorites_count, :integer, default: 0, null: false
    change_column :users, :upvotes_count, :integer, default: 0, null: false
    change_column :users, :downvotes_count, :integer, default: 0, null: false
  end
end
