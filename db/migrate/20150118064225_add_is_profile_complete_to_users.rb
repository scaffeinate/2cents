class AddIsProfileCompleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_profile_complete, :boolean, null: false, default: false
  end
end
