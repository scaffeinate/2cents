class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.references :user, index: true
      t.string :location, null: false

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end
