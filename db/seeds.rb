require "csv"

CSV.foreach('db/seeds/brand.csv', headers: true) do |row|
  Brand.create(
    name: row['name']
  )
end

require './db/seeds/category_size.rb'

require './db/seeds/category.rb'

require './db/seeds/size.rb'