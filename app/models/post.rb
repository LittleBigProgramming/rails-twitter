class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 5..144 }
  validates :user, presence: true

  default_scope do
    order(created_at: :desc)
  end

  delegate :username, to: :user
end
