class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, uniqueness: {scope: :post_id}

  def self.is_favorite?(post, user)
    find_by(post_id: post.id, user_id: user.id)
  end
end
