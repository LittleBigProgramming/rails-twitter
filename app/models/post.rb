class Post < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user

  scope :search, lambda { |term:|
    joins("LEFT JOIN text_posts ON content_type = 'TextPost' AND content_id = text_posts.id")
      .where('text_posts.body LIKE ?', "%#{term}%")
  }
end
