class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true, case_sensitive: false

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followers, through: :follower_relationships

  def timeline_posts
    Post.where(user_id: followed_user_ids + [id])
  end

  def follow(user)
    followed_users << user
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def unfollow(user)
    followed_users.delete(user)
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
