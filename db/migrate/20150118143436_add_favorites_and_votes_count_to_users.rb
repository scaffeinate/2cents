class AddFavoritesAndVotesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorites_count, :integer
    add_column :users, :upvotes_count, :integer
    add_column :users, :downvotes_count, :integer
  end
end
