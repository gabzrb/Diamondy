class Product < ApplicationRecord
  belongs_to :user
  has_one :jewel
  has_one :special_request
  has_one :stone
  has_one :watch
end
