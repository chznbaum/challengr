class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  validates_presence_of :name, :username

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
