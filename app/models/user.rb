class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :login

  devise :database_authenticatable, :registerable,
    :recoverable, :confirmable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, length: { maximum: 20 }, :uniqueness => { case_sensitive: false }

  mount_uploader :avatar, AvatarUploader

  def slug_candidates
    [
      [:first_name, :last_name]
    ]
  end

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_many :posts
  has_many :authentications
  has_many :upvotes
  has_many :downvotes
  has_many :favorites
  has_many :comments
  has_many :categories

  def self.find_for_oauth(auth)
    registered_user = User.where(:email => auth.info.email).first
    if registered_user
      return registered_user
    else
      user = User.new(first_name: auth.info.first_name, last_name: auth.info.last_name, email: auth.info.email,
                      password: Devise.friendly_token[0,20], remote_avatar_url: auth.info.image.gsub('http://','https://'),
                      has_random_password: true)
      user.skip_confirmation!
      user.save
      return user
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
