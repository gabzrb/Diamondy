class Jewel < ApplicationRecord
  belongs_to :product

  STATES = ["Bijou ancien (occasion)",
            "Bijou signés (occasion)",
            "Bijoux modernes (occasion)",
            "Bijoux neuf"]

  CATEGORY = ["bague",
              "bracelet",
              "collier",
              "boucles d'oreilles",
              "pendentif",
              "broche",
              "bouton de manchette"]

  BRANDS = ["Cartier",
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

