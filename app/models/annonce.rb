class Annonce < ApplicationRecord
  # REMOVE ALGOLIA
  # include AlgoliaSearch

  # algoliasearch do
  #   attributes :description, :category
  # end

  searchkick

  belongs_to :user
  validates :category, inclusion: { in: ["Bijoux","Diamant","Montre", "Demande spéciale"] }
end
