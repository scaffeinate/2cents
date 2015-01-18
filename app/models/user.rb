class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :confirmable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }

  mount_uploader :avatar, AvatarUploader

  has_many :authentications
  has_many :upvotes
  has_many :downvotes
  has_many :favorites

  def self.find_for_oauth(auth)
    registered_user = User.where(:email => auth.info.email).first
    if registered_user
      return registered_user
    else
      user = User.new(first_name: auth.info.first_name, last_name: auth.info.last_name, email: auth.info.email,
                      password: Devise.friendly_token[0,20], remote_avatar_url: auth.info.image.gsub('http://','https://'))
      user.skip_confirmation!
      user.save
    end
  end

end
