class Category < ApplicationRecord
  has_many :items
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
  has_ancestry

  validates :name, presence: true
end
