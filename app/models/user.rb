class User < ActiveRecord::Base
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :bookclubs
  has_many :posts
  has_many :topics

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  has_secure_password
  
  # To follow a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id) 
  end

  # To unfollow a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Test to see if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end
end
