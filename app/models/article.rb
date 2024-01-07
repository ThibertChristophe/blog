class Article < ApplicationRecord
  # Relations
  belongs_to :category, counter_cache: true
  has_many :comments
  has_and_belongs_to_many :tags
  # Relation polymorphic
  has_many :pictures, as: :imageable

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 10 }

  # Filtres
  # scope par defaut
  default_scope { order(created_at: :asc) }

  # sorte de filtre dispo que l'on cree
  scope :published, -> { where(online: true) }
  # scope avec parametre
  scope :online, ->(param) { where(online: param) }
  # scope avec un bloc
  scope :onlineVerif, lambda { |param|
    where(online: param) if param.to_b?
  }

  # methode de classe comme un scope
  # attention cette methode peut renvoyer null
  # et donc renvoyer une erreur
  def self.offline
    where(online: false)
  end
end
