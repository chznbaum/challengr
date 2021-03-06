class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates_presence_of :name, :username

  has_many :active_relationships, class_name: "Relationship",
         foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
         foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :blogs, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  # Check if a given role matches any of the user's roles
  def role?(role)
    current_user.roles.any? { |r| r.name.underscore.to_sym == role }
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
    following_ids = "SELECT followed_id FROM relationships
    WHERE follower_id = :user_id"
    Blog.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
end
