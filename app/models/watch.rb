class Watch < ApplicationRecord
  belongs_to :product
  has_one :product, dependent: :destroy
end
