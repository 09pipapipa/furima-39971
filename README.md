## Usersテーブル

|     Column         |Type       |Options        |
|--------------------|-----------|---------------| 
| username           | string    |  null: false  |
| email              | string    |  null: false  |
| encrypted_password | string    |  null: false  |
| phonenumber        | integer   |  null: false  |
| birthday           | integer   |  null: false  |
| first-name         | string    |  null: false  |
| last-name          | string    |  null: false  |


## Association

- has_many :items
- has_many :buys
- has_many  :addresses

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

|     Column         |Type       |Options      |
|--------------------|-----------|-------------| 
| postalcode         | integer   | null: false |
| prefecture         | string    | null: false |
| city               | string    | null: false |
| streetaddress      | string    | null: false |
| buildingname       | string    |             |
| phonenumber        | integer   | null: false |

## Association

- belongs_to :user