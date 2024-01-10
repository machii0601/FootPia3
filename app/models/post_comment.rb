class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :activity, as: :subject, dependent: :destroy
  after_create_commit :create_activities


  validates :post_comment, presence: true
  def self.looks(search, word)
    if search == "perfect_match"
      @post_comment = PostComment.where("post_comment LIKE?", "#{word}")
    elsif search == "partial_match"
      @post_comment = PostComment.where("post_comment LIKE?","%#{word}%")
    else
      @post_comment = PostComment.all
    end
  end

  private

  def create_activities
    Activity.create!(subject: self, user_id: ユーザーのID, action_type: Activity.action_types[:enumで設定した内容])
  end

end
