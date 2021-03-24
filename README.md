# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| item_category_id    | integer    | null: false                    |
| item_status_id      | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| customers_state_id  | integer    | null: false                    |
| days_to_delivery_id | integer    | null: false                    |
| item_price          | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipment

## shipment テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| customers_post_code      | string     | null: false                    |
| customers_state_id       | integer    | null: false                    |
| customers_city           | string     | null: false                    |
| customers_street_address | string     | null: false                    |
| customers_suburb         | string     |                                |
| customers_telephone      | string     | null: false                    |
| purchase                 | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase