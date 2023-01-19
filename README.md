# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false,unique: true       |
| encrypted_password | string     | null: false                    |
| family_name_kanji  | string     | null: false                    |
| first_name_kanji   | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_year         | string     | null: false                    |
| birth_month        | string     | null: false                    |
| birth_day          | string     | null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :shippingaddresses
- has_many :purchaserecords

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchaserecord

## comments テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shippingaddresses

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | null: true                     |
| telephone_number   | string     | null: false                    |
| purchaserecord_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchaserecord

## purchaserecords

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :shippingaddress