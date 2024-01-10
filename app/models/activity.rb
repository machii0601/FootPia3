class Activity < ApplicationRecord
  belongs_to :subject, polymorphic: true
  has_one :activity, as: :subject, dependent: :destroy
    enum action_type: {
    favorite:  0,
    follow:    1,
    comment:   2
  }
end
