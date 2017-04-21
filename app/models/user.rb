class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  validates_presence_of :name, :username

  has_many :active_relationships, class_name: "Relationship",
         foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
         foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :blogs, dependent: :destroy

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  # Follows a user
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user
  def unfollow(other_user)
    following.delete(other_user)
  end
  
  # Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end

  # Defines a proto-feed
  def feed
    Blog.where("user_id = ?", id)
  end
end
