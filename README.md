# テーブル設計

## users テーブル

| Colum               | Type     | Options                   |
| ------------------- | -------- | ------------------------- |
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| first_name          | string   | null: false               |
| last_name           | string   | null: false               |
| first_name_kana     | string   | null: false               |
| last_name_kana      | string   | null: false               |
| birth_date          | date     | null: false               |

## Associations
- has_many :items
- has_many :orders

## items テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| payer_id           | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| waiting_days_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Associations
- belongs_to :user
- has_one :order

## orders テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## Associations
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| telephone_number   | string     | null: false                    |
| building           | string     |                                |
| oder               | references | null: false, foreign_key: true |

## Associations
- belongs_to :order
