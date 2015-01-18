class Downvote < ActiveRecord::Base

  validates :post, presence: true
  validates :user, presence: true

  belongs_to :user, counter_cache: true
  belongs_to :post
end
