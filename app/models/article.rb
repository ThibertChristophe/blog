class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.published
    where(online: true)
  end
end
