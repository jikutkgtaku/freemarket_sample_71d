# DB設計

## usersテーブル
|Column|Type|Option|
|-------|----|-------|
|nickname|string|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|tel_number|string|null: false, unique: true|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

## Associations
- has_many :items, dependent::destroy
- has_many :comments, dependent::destroy
- has_many :favorites, dependent::destroy
- has_many :evaluations, dependent::destroy
- has_many :addresses, dependent::destroy
- has_many :creditcards, dependent::destroy


### addresses テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post_number|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string||
|tel_number|string|

### Association
- belongs_to :user, optional: true

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
|introduction|text||
|price|integer|null: false, index: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true, optional: true|
|seller_id|references|null: false, foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|size_id|references|null: false, fereign_key: true|
|shipping_fee_id|references|null: false, fereign_key: true|
|prefecture_id|references|null: false, fereign_key: true|
|shipping_period_id|references|null: false, fereign_key: true|
|shipping_way_id|references|null: false, fereign_key: true|
|status_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|closed_at|datetime||

### Association
- belongs_to :seller, class_name: "User"
- has_many :images, dependent::destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :buyer, class_name: "User"
- has_many :favorites, dependent::destroy
- has_many :evaluations
- has_many :comments, dependent::destroy
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_period
- belongs_to_active_hash :shipping_way
- belongs_to_active_hash :size

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string||

### Association
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

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
|reviewer_id|references|null: false, foreign_key: true|
|reciever_id|references|null: false, foreign_key: true|
|rating_id|references|null: false, foreign_key: true|
|review|text||
|item_id|references|null: false, foreign_key: true|

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



