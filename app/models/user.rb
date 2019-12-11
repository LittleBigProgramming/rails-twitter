class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true, case_sensitive: false

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  has_many :following_relationships, foreign_key: :follower_id
  has_many :followed_users, through: :following_relationships

  def follow(user)
    followed_users << user
  end

  def like(post)
    liked_posts << post
  end

  def unlike(post)
    liked_posts.destroy(post)
  end

  def liked?(post)
    liked_post_ids.include?(post.id)
  end

  def to_param
    username
  end
end
