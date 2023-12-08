class GroupUser < ApplicationRecord
  has_many :group
  has_many :user
end
