class Genru < ApplicationRecord
  belongs_to :group
  validates :level_name, presence: true
  validates :area_name, presence: true
end
