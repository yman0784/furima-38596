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
| birthday           | date       | null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :purchase_records

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
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase_record

## comments テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| purchase_record    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address