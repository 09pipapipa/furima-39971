## Usersテーブル

|     Column         |Type       |Options                      |
|--------------------|-----------|-----------------------------| 
| username           | string    |  null: false                |
| email              | string    |  null: false, unique :true  |
| encrypted_password | string    |  null: false                |
| birthday           | date      |  null: false                |  年月日はdate型推奨
| first_name         | string    |  null: false                |
| last_name          | string    |  null: false                |
| first_name_kana    | string    |  null: false                |
| last_name_kana     | string    |  null: false                |  -は使用不可


## Association

- has_many :items
- has_many :buys


## itemsテーブル

|     Column         |Type       |Options                       |
|--------------------|-----------|------------------------------| 
| user               | references| null: false,foreign_key: true|
| goods_name         | string    | null: false                  |
| price              | integer   | null: false                  |
| exposition         | text      | null: false                  |  (説明)
| category_id        | integer   | null: false                  |
| condition_id       | integer   | null: false                  |  (状態)
| cost_id            | integer   | null: false                  | (配送料)
| prefecture_id      | integer    | null: false                  | (地域)
| delivery_date_id   | integer   | null: false                  | (日数)

## Association

- has_one   :buy
- belongs_to :user

## buysテーブル

|   Column |    Type      |    Options                    |
|----------|--------------|-------------------------------| 
| user     |  references  | null: false,foreign_key: true | (購入日時)
| item     |  references  | null: false,foreign_key: true | (金額)


## Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address

|     Column         |Type       |Options                        |
|-------------------|-----------|--------------------------------|
| buy               | references| null: false,foreign_key: true  |
| postal_code       | string    | null: false                    |
| prefecture_id     | integer   | null: false                    |
| city              | string    | null: false                    |
| street_address    | string    | null: false                    |
| building_name     | string    |                                |
| phone_number      | string    | null: false                    |

## Association

- belongs_to :buy
