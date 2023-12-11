class Post < ApplicationRecord
  has_many :post_coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :post_content, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def save_tags(tags)
    # タグをスペース区切りで分割し配列にする
    tag_list = tags.split(/[[:blank:]]+/)
    # 自分自身に関連づいたタグを取得する
    current_tags = self.tags.pluck(:name)
    # (1)記録更新時に削除されたタグ
    old_tags = current_tags - tag_list
    # (2)新規に追加されたタグ
    new_tags = tag_list - current_tags
    p current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
    self.tags << new_post_tag
    end
  end
end
