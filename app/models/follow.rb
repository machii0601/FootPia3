class Follow < ApplicationRecord

  belongs_to :user
  has_many :users, dependent: :destroy
  after_create_commit :create_activities

  private

  def create_activities
    Activity.create!(subject: self, user_id: user.id, action_type: Activity.action_types[:follow])
  end
end
