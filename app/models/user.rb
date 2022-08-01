class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :photo

  acts_as_followable
  acts_as_follower

  extend FriendlyId
  friendly_id :username, use: :slugged
end
