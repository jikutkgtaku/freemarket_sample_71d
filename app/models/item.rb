class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to              :seller         ,class_name: "User"
  has_many                :images         ,dependent: :destroy
  belongs_to              :category
  belongs_to              :brand          ,optional: true
  belongs_to              :buyer          ,class_name: "User", optional: true
  # has_many                :favorites      ,dependent: :destroy
  # has_many                :evaluations
  # has_many                :comments       ,dependent: :destroy
  belongs_to_active_hash  :condition
  belongs_to_active_hash  :shipping_fee
  belongs_to_active_hash  :prefecture
  belongs_to_active_hash  :shipping_period
  belongs_to_active_hash  :shipping_way
  belongs_to_active_hash  :size
  belongs_to_active_hash  :status

  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド
  # 引数として、子モデルの名前を記載する。
  # allow_destroy: trueで、親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除できる。
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :introduction, :price, :category_id, :seller_id, :condition_id, :size, :shipping_fee_id, :prefecture_id, :shipping_period_id, :shipping_way_id, :status_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 9999999 }
  validates :name, length: { maximum: 40 }
  validates :introduction, length: { maximum: 1000 }
end
