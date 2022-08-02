require 'json'
require 'open-uri'

class Post < ApplicationRecord
  belongs_to :user
  enum status: [:public, :followers, :private], _prefix: :posts

  def webmentions
    url = "https://webmention.io/api/mentions.jf2?domain=www.personalspace.cc/posts/#{self.id}/&token=-T39nR860VEVQhF62w6hjQ
    &per-page=10"
    p "======================"
    response = URI.open(url).read
    p JSON.parse(response)
    p "======================"
  end

end
