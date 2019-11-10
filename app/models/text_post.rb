class TextPost < ApplicationRecord
  validates :body, presence: true, length: { in: 5..144 }
end
