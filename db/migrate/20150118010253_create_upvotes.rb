class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :upvotes, :users
    add_foreign_key :upvotes, :posts
  end
end
