class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one :activity, as: :subject, dependent: :destroy
  after_create_commit :create_activities

  validates :user_id, uniqueness: {scope: :post_id}

  def self.is_favorite?(post, user)
    find_by(post_id: post.id, user_id: user.id)
  end

  private

  def create_activities
    Activity.create!(subject: self, user_id: ユーザーのID, action_type: Activity.action_types[:enumで設定した内容])
  end
end
