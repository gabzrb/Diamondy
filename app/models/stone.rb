class Stone < ApplicationRecord
  SIZES = ['brillant(rond)', 'coussin', 'émeraude', 'radiant', 'baguette', 'coeur', 'ovale',  'marquise', 'princesse', 'poire', 'triangle']
  COLORS = ['D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'MZ']
  PURITY = ['IF-LC', 'VVS1', 'VVS2', 'VS1', 'VS2', 'SI1', 'SI2', 'P1', 'P2', 'P3']
  CERTIFICATES = ['HRD', 'GIA', 'LFG', 'Pas de certificat']


  belongs_to :product
  validates :size, inclusion: { in: SIZES }
  validates :color, inclusion: { in: COLORS }
  validates :purity, inclusion: { in: PURITY }
  validates :certificate, inclusion: { in: CERTIFICATES }


end
