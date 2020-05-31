class Category < ApplicationRecord
  belongs_to :item
  has_ancestry
end
