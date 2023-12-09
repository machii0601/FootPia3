class Follow < ApplicationRecord
  belongs_to :user
  has_many :users, dependent: :destroy
end
