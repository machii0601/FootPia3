class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :descreption, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
