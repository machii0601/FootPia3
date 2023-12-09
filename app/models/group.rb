class Group < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :group_users, dependent: :destroy
  validates :owner_first_name, presence: true
  validates :owner_last_name, presence: true
  validates :owner_first_name_kane, presence: true
  validates :owner_last_name_kana, presence: true
  validates :group_name, presence: true
  validates :description, presence: true
end
