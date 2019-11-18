class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  def like(post)
    liked_posts << post
  end

  def unlike(post)
    liked_posts.destroy(post)
  end

  def liked?(post)
    liked_post_ids.include?(post.id)
  end
end
