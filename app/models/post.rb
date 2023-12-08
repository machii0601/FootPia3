class Post < ApplicationRecord
  belongs_to :post_coment
  belongs_to :favorite
  has_many :user
end
