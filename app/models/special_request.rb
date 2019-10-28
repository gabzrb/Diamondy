class SpecialRequest < ApplicationRecord
  belongs_to :product
  searchkick

  CATEGORIES = ["Saphirs", "Rubis", "Emeraudes"]
  validates :categorie, inclusion: { in: CATEGORIES }

  def self.by_category(categorie)
    SpecialRequest.all.select{ |sr| sr.categorie == categorie}
  end
end
