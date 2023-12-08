class Post < ApplicationRecord
  belongs_to :post_coment
  belongs_to :favorite
  has_many :user
  has_one_attached :image
  validates :title, presence: true
  validates :post_content, presence: true
end
