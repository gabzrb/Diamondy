class Annonce < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :description, :category
  end

  belongs_to :user
  validates :category, inclusion: { in: ["Bijoux","Diamant","Montre", "Demande spéciale"] }
end
