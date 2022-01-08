# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| date_of_birth       | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| situation_id     | integer    | null: false                    |
| consignor_id     | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| days_to_ship_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code        | string     | null: false |
| shipping_area_id | integer    | null: false |
| municipalities   | string     | null: false |
| address          | string     | null: false |
| building         | string     |             |
| telephone_num    | string     | null: false |
| purchase         | references | null: false |

### Association

- belongs_to :purchase