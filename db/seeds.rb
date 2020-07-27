require "csv"

CSV.foreach("db/seeds/brand.csv", headers: true) do |row|
  Brand.create(
    name: row["name"]
  )
end