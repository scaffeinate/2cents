class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.references :post, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :post_categories, :posts
    add_foreign_key :post_categories, :categories
  end
end
