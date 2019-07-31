class Product < ApplicationRecord
  belongs_to :user
  has_one :jewel, dependent: :destroy
  has_one :special_request, dependent: :destroy
  has_one :stone, dependent: :destroy
  has_one :watch, dependent: :destroy
  has_many :product_attachments
  accepts_nested_attributes_for :product_attachments

  def conect
    return self.jewel if self.jewel
    return self.special_request if self.special_request
    return self.stone if self.stone
    return self.watch if self.watch
  end
end
