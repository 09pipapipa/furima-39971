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
- has_one  :address


## itemsテーブル

|     Column         |Type       |Options      |
|--------------------|-----------|-------------| 
| goodsname          | string    | null: false |
| price              | integer   | null: false |
| exposition  (説明) | text      | null: false |
| category           | string    | null: false |
| condition   (状態) | string    | null: false |
| image              |           |             |
| cost   (配送料)    | integer    | null: false |
| region (地域)      | string     | null: false |
| days     (日数)    | integer    | null: false |

## Association

- has_one   :buy
- belongs_to :user

## buysテーブル

|     Column         |Type       |Options                        |
|--------------------|-----------|-------------------------------| 
| datetime(購入日時)  | integer   | null: false                   |  
| amount (金額)       |  integer  | null: false                  |
| comment            | text      |                               |

## Association

- belongs_to :user
- belongs_to :item

## address

|     Column         |Type       |Options                         |
|--------------------|-----------|--------------------------------| 
| city               | string    | null: false                    |
| streetaddress      | string    | null: false, foreign_key: true |
| buildingname       | string    |              foreign_key: true |
| phonenumber        | string   | null: false,  foreign_key: true |
