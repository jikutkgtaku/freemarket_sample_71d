class Image < ApplicationRecord
  belongs_to :item, optional: true
  # carrierwave実装時に使用
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
