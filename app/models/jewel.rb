class Jewel < ApplicationRecord
  belongs_to :product

  STATES = ["Bijoux anciens (occasion)",
            "Bijoux signés (occasion)",
            "Bijoux modernes (occasion)",
            "Bijoux neuf"]

  CATEGORY = ["Bague",
              "Bracelet",
              "Collier",
              "Boucles d'oreilles",
              "Pendentif",
              "Broche",
              "Bouton de manchette"]

  BRANDS = ["Aucune",
           "Cartier",
           "Chaumet",
           "Chopard",
           "Bulgarie",
           "Van Cleef et Arpel",
           "Pommelato",
           "Dinh Van",
           "Piaget",
           "Messika",
           "Mauboussin",
           "Chanel",
           "Hermes"]

  validates :category, inclusion: { in: CATEGORY }
  validates :brand, inclusion: { in: BRANDS }
  validates :state, inclusion: { in: STATES }

end

