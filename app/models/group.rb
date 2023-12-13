class Group < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :group_users, dependent: :destroy
  validates :group_name, presence: true
  validates :description, presence: true

  def is_owned_by?(user)
    owner_id == user.id
  end

  def is_join?(user)
    group_users.find_by(user_id: user.id, group_id: id)
  end
end
