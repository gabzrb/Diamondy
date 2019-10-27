class SpecialRequest < ApplicationRecord
  belongs_to :product
  searchkick

  CATEGORIES = ["Saphirs", "Rubis", "Emeraudes"]
  validates :categorie, inclusion: { in: CATEGORIES }
end
