class Jewel < ApplicationRecord
  STATES = ['Bijou ancien (occasion)',
              'Bijou signés (occasion)',
              'Bijoux modernes (occasion)',
              'Bijoux neuf']

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

  belongs_to :product
  validates :state, inclusion: { in: STATES }
  validates :brand, inclusion: { in: CATEGORY }
  validates :category, inclusion: { in: BRANDS }

end

