class Item < ApplicationRecord
  belongs_to              :seller         ,class_name: "User"
  has_many                :images         ,dependent: :destroy
  belongs_to              :category
  belongs_to              :brand          ,optional: true
  belongs_to              :buyer          ,class_name: "User"
  # has_many                :favorites      ,dependent: :destroy
  # has_many                :evaluations
  # has_many                :comments       ,dependent: :destroy
  belongs_to_active_hash  :condition
  belongs_to_active_hash  :shipping_fee
  belongs_to_active_hash  :prefecture
  belongs_to_active_hash  :shipping_period
  belongs_to_active_hash  :shipping_way
  belongs_to_active_hash  :size

  validates :name, :price, :category, :seller, :condition, :size, :shipping_fee, :prefecture, :shipping_period, :shipping_way, :status, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 9999999 }
end