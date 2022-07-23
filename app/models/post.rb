class Post < ApplicationRecord
  belongs_to :user
  enum status: [:public, :followers, :private], _prefix: :posts
end
