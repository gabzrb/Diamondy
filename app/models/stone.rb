
class Stone < ApplicationRecord
  # DIAMOND CLASS

  SHAPES = ['Brillant', 'Coussin', 'Émeraude', 'Radiant', 'Baguette', 'Coeur', 'Ovale', 'Marquise', 'Princesse', 'Poire', 'Triangle']
  QUALIFICATIONS = ['Fair', 'Good', 'Very Good', 'Excellent']
  COLORS = ['D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'MZ']
  PURITY = ['IF-LC', 'VVS1', 'VVS2', 'VS1', 'VS2', 'SI1', 'SI2', 'P1', 'P2', 'P3']
  CERTIFICATES = ['HRD', 'GIA', 'LFG', 'Autre', 'Pas de certificat']
  FLUO = ['None -Nil', 'Slight', 'Medium', 'Strong']

  belongs_to :product
  validates :size, inclusion: { in: QUALIFICATIONS }
  validates :color, inclusion: { in: COLORS }
  validates :purity, inclusion: { in: PURITY }
  validates :certificate, inclusion: { in: CERTIFICATES }
  validates :symetry, inclusion: { in: QUALIFICATIONS }
  validates :polish, inclusion: { in: QUALIFICATIONS }
  validates :fluo, inclusion: { in: FLUO }
  validates :shape, inclusion: { in: SHAPES }

  mount_uploader :cert_attachment, CertificateUploader

  def self.by_size(range)
    Stone.all.select { |diamond| range.include? diamond.size }
  end

  def self.by_polish(range)
    Stone.all.select { |diamond| range.include? diamond.polish }
  end

  # Max weight 50 Carats by default
  def self.by_weight(min, max = 50)
    return [] if max < min

    Stone.all.select { |diamond| (min..max).include? diamond.weight }
  end

  def self.by_color(range)
    Stone.all.select { |diamond| range.include? diamond.color }
  end

  def self.by_purity(range)
    Stone.all.select { |diamond| range.include? diamond.purity }
  end

  def self.by_symetry(range)
    Stone.all.select { |diamond| range.include? diamond.symetry }
  end

  def self.by_certificate(cert)
    Stone.all.select { |diamond| cert == diamond.certificate }
  end
end
