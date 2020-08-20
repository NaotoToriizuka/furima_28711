# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_one  :purchase

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_days_id | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| price           | integer    | null: false                    |

### Association

- belongs_to             :user
- has_one                :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :prefecture

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address
- has_one    :card

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to             :purchase
- belongs_to_active_hash :prefecture

## cards テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| number          | integer | null: false |
| expiration_date | integer | null: false |
| security_code   | integer | null: false |

### Association

- belongs_to :purchase


#### Active_Hash

## category 

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| category | string | null: false |

## condition

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| condition | string | null: false |

## postage_payer

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postage_payer | string | null: false |

# shipping_day

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| shipping_day | string | null: false |

# prefecture

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| prefecture | string | null: false |


