class SpecialRequest < ApplicationRecord
  belongs_to :product

  include AlgoliaSearch

  algoliasearch do
    attributes :description
  end
end
