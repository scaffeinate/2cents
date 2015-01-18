class Comment < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 150 }
  validates :post, presence: true
  validates :user, presence: true

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true
end
