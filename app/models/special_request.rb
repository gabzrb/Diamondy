class SpecialRequest < ApplicationRecord
  belongs_to :product
  searchkick

  # include AlgoliaSearch

  # algoliasearch do
  #   attributes :description
  # end
end
