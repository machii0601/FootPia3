class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :group_comments, dependent: :destroy
  has_many :follows
  has_many :activities, dependent: :destroy
  has_one_attached :profile_image

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.first_name = "guest"
      user.last_name = "user"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  # フォローユーザーの検索
  #   フォロー済みの場合、ユーザーデータを返す
  #   フォローしていない場合は、nilを返す
  def following?(current_user, follow_id)
    # Followから自分と対象のユーザーがANDになっているレコードを検索
    Follow.find_by(user_id: follow_id, follow_id: current_user.id)
  end

  # フォローしている一覧取得
  def followed(user)
    Follow.where(follow_id: user.id)
  end

  # フォローされている一覧取得
  def follower(current_user)
    Follow.where(user_id: current_user.id)
  end

end
