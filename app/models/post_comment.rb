class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post_comment, presence: true
  def self.looks(search, word)
    if search == "perfect_match"
      @post_comment = PostComment.where("post_comment LIKE?", "#{word}")
    elsif search == "partial_match"
      @post_comment = PostComment.where("post_comment LIKE?","%#{word}%")
    else
      @post_comment = PostComment.all
    end
  end
end
