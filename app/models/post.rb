class Post < ActiveRecord::Base

  self.per_page = 4

  validates :content, presence: true, length: { maximum: 240 }
  validates :location, presence: true
  validates :user, presence: true

  belongs_to :user, counter_cache: true
  has_many :upvotes
  has_many :downvotes
  has_many :favorites
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

end
