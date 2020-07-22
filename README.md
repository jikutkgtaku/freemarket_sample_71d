# DB設計

## usersテーブル
|Column|Type|Option|
|-------|----|-------|
|nickname|string|null: false, unique: true|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|tel_number|string|null: false, unique: true|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

## Associations
- has_many :items, dependent::destroy
- has_many :addresses, dependent::destroy
- has_many :comments, dependent::destroy
- has_many :favorites, dependent::destroy
- has_many :evaluations, dependent::destroy
- has_many :creditcards, dependent::destroy


### addresses テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post_number|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string||
|tel_number|string||

### Association
- belongs_to :user, optional: true

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|payjp_id|string|null: false|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|introduction|text|null: false|
|price|integer|null: false, index: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|seller|references|null: false, foreign_key: true|
|condition_id|integer|null: false|
|size_id|integer|null: false|
|shipping_fee_id|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_period_id|integer|null: false|
|shipping_way_id|integer|null: false|
|status_id|integer|null: false|
|buyer|references|foreign_key: true|
|closed_at|datetime||

### Association
- belongs_to :seller, class_name: "User"
- has_many :images, dependent::destroy
- belongs_to :category
- belongs_to :brand, optional: true
- belongs_to :buyer, class_name: "User"
- has_many :favorites, dependent::destroy
- has_many :evaluations
- has_many :comments, dependent::destroy
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_period
- belongs_to_active_hash :shipping_way
- belongs_to_active_hash :size
- belongs_to_active_hash :status


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string||

### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|reviewer|references|null: false, foreign_key: true|
|receiver|references|null: false, foreign_key: true|
|rating|references|null: false, foreign_key: true|
|review|text||
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :reviewer, class_name: "User"
- belongs_to :reciever, class_name: "User"
- belongs_to_active_hash :rating

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|

### Association
- has_many :items




