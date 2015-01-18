class Post < ActiveRecord::Base

  self.per_page = 20

  validates :content, presence: true, length: { maximum: 240 }
  validates :location, presence: true
  validates :user, presence: true
  belongs_to :user

end
