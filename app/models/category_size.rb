class CategorySize < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :size, optional: true
end
