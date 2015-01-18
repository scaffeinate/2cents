class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :user, index: true
      t.integer :posts_count

      t.timestamps null: false
    end
    add_foreign_key :categories, :users
  end
end
