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
| date_of_birth       | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product_name  | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | enum       | null: false                    |
| situation     | enum       | null: false                    |
| consignor     | enum       | null: false                    |
| shipping_area | enum       | null: false                    |
| days_to_ship  | enum       | null: false                    |
| price         | integer    | null: false                    |
| seller        | string     | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer      | text       | null: false                    |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | integer    | null: false |
| prefectures    | enum       | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| telephone_num  | integer    | null: false |
| user           | references | null: false |

### Association

- has_one :purchase