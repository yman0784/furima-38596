# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false,unique: true       |
| encrypted_password | string     | null: false                    |
| name               | string     | null: false                    |
| name_kana          | string     | null: false                    |
| birthday           | date       | null: false                    |
| item               | references | null: false, foreign_key: true |

### Association

- has_many :items, through: :item_users
- has_many :comments
- has_many :shippingaddress
- has_many :purchaserecords

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| item_category      | text       | null: false                    |
| item_condition     | text       | null: false                    |
| shipping_cost      | string     | null: false                    |
| sender_prefecture  | string     | null: false                    |
| shipping_date      | date       | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_many :users, through: :room_users
- has_many :comments
- has_one :shippingaddress
- has_one :purchaserecord

## room_users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shippingaddress

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | null: false                    |
| telephone_number   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchaserecord

## purchaserecords

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :shippingaddress