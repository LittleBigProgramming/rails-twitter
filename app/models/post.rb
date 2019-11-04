class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 5..144 }
  validates :user, presence: true
end
