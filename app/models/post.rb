class Post < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  default_scope do
    order(created_at: :desc)
  end

  delegate :username, to: :user
end
