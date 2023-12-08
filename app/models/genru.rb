class Genru < ApplicationRecord
  has_many :genre
  validates :level_name, presence: true
  validates :area_name, presence: true
end
