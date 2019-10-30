class Annonce < ApplicationRecord
  searchkick

  belongs_to :user
  validates :category, inclusion: { in: ["Bijoux", "Diamant", "Montre", "Demande spéciale"] }
end
