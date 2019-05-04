class Product < ApplicationRecord
  belongs_to :user
  has_one :jewel, dependent: :destroy
  has_one :special_request, dependent: :destroy
  has_one :stone, dependent: :destroy
  has_one :watch, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  mount_uploader :photo1, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
end
