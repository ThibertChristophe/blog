class Category < ApplicationRecord
  has_many :articles
  validates :name, presence: true
  # Relation polymorphic
  has_many :pictures, as: :imageable
end
