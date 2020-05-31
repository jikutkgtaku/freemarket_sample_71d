class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :user, :post_numer, :lastname, :firstname, :prefecture, :city, :address, presence: true
  
  validates :firstname     , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lastname      , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :tel_number    , numericality: { only_integer: true }, length: { in: 10..11 }
end
