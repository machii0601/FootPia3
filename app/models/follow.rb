class Follow < ApplicationRecord

  belongs_to :user
  has_many :users, dependent: :destroy
  after_create_commit :create_activities

  private

  def create_activities
    Activity.create!(subject: self, user_id: ユーザーのID, action_type: Activity.action_types[:enumで設定した内容])
  end
end
