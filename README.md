# DB設計

## Usersテーブル
|Colum|Type|Option|
|-------|----|-------|
|nickname|string|null :false, unique: true, index: true|
|email|string|null :false, unique: true|
|password|string|null :false|
|family_name|string|null :false|
|first_name|string|null :false|
|family_name_kana|string|null :false|
|first_name_kana|string|null :false|
|birth_year|integer|null :false|
|birth_month|integer|null :false|
|birth_day|integer|null :false|
|phone_number|string|null :false, unique: true|

## Associations
- has_many :items
- has_many :comments
- has_many :favorites, dependent :destroy
- has_many :evaluations, dependent :destroy
- has_many :address, dependent: :destroy
- has_many :creditcard, dependent: :destroy


### address テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|apartment_name|string|
|phone_number|string|

### Association
- belongs_to :user

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|payjp_id|string|null: false|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|introduction|text||
|conditions_id|references|null: false, foreign_key: true|
|size_id|references|null: false, fereign_key: true|
|shipping_fee_id|references|null: false, fereign_key: true|
|prefecture_id|references|null: false, fereign_key: true|
|shipping_period_id|references|null: false, fereign_key: true|
|price|integer|null: false, index: true|
|shipping_way_id|references|null: false, fereign_key: true|
|status_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|closed_at|datetime||

### Association
- belongs_to :seller, class_name: "User"
- has_many :images, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :buyer, class_name: "User"
- has_many :favorites, dependent: :destroy
- has_many :evaluations
- has_many :comments, dependent: :destroy
- belongs_to_active_hash : conditions
- belongs_to_active_hash : shipping_costs
- belongs_to_active_hash : prefectures
- belongs_to_active_hash : shipping_periods
- belongs_to_active_hash : shipping_ways
- belongs_to_active_hash : sizes

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string||

### Association
- belongs_to :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :items

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|reviewer_id|reference|null: false, foreign_key: true|
|reciever_id|reference|null: false, foreign_key: true|
|rating|reference|null: false, foreign_key: true|
|review|text||
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- belongs_to_active_hash :ratings

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|

### Association
- has_many :items



