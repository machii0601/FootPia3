class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
