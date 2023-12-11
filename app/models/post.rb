class Post < ApplicationRecord
  has_many :post_coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :post_content, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
end
