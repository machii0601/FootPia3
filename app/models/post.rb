class Post < ApplicationRecord
  has_many :post_coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :post_content, presence: true
end
