class Product < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :price
  mount_uploader :image, PhotoUploader

end
