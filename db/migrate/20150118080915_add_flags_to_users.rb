class AddFlagsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_profile_complete, :boolean, default: false, null: false
    add_column :users, :has_random_password, :boolean, default: false, null: false
  end
end
