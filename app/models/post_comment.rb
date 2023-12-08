class PostComment < ApplicationRecord
  has_many :user
  has_many :post
  validates :post_comment, presence: true
end
