class Event < ApplicationRecord
  has_many :users, dependent: :destroy
  has_one_attached :image
  validates :title, presence: true
  validates :descreption, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
