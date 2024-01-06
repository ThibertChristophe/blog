class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :body, presence: true
end
