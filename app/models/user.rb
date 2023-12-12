class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
