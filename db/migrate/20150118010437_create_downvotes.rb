class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :downvotes, :users
    add_foreign_key :downvotes, :posts
  end
end
