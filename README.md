##ER図
![FURIMA DB NEW](https://user-images.githubusercontent.com/60571920/82986281-8b0d4b00-a030-11ea-9205-fc88298dd778.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|telnum|integer |null: false|
|gender|integer |null: false|
|year|integer|null: :false|
|month|integer|null: :false|
|day|integer|null: :false|
### Association
has_one :address</br>
has_one :card</br>
has_many :items</br>

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|category_id|reference|null: false, foreign_key: true|
|brand|string||
|condition_id|integer|null: false|
|shipping_cost_id|integer|null: false|
|shipping_days_id|integer|null: false|
|shipping_area_id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|costomer|integer||
### Association
belongs_to :user</br>
belongs_to :category</br>
has_many :item_images</br>

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string||
|phone|string||
|user_id|reference|null: false, foreign_key: true|
### Association
belongs_to :user</br>

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
belongs_to :user</br>

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
has_many :items</br>

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to :item