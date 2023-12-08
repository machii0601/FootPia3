class Group < ApplicationRecord
  belongs_to :genre
  belongs_to :group
  validates :owner_first_name, presence: true
  validates :owner_last_name, presence: true
  validates :owner_first_name_kane, presence: true
  validates :owner_last_name_kana, presence: true
  validates :group_name, presence: true
  validates :description, presence: true
end
