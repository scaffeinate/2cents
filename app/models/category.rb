class Category < ActiveRecord::Base

  validates_presence_of :user

  has_many :post_categories
  has_many :posts, through: :post_categories
  belongs_to :user
end
