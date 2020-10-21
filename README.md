# テーブル設計



## users

|Column              |Type     |Options                |
|--------------------|---------|-----------------------|
| nickname           | string  | null:false            |
| email              | string  | null:false,unique:true|
| encrypted_password | string  | null:false            |
| last_name          | string  | null:false            |
| first_name         | string  | null:false            |
| last_name_kana     | string  | null:false            |
| first_name_kana    | string  | null:false            |
| birth_date         | date    | null:false            |

### Association

- has_many :items
- has_many :purchases



## items

|Column          |Type        |Options                      |
|----------------|------------|-----------------------------|
| user           | references | foreign_key:true, null:false|
| goods_name     | string     | null:false                  |
| description    | text       | null:false                  |
| category_id    | integer    | null:false                  |
| condition_id   | integer    | null:false                  |
| post_payer_id  | integer    | null:false                  |
| prefecture_id  | integer    | null:false                  |
| heading_time_id| integer    | null:false                  |
| price          | integer    | null:false                  |

### Association

- belongs_to :user
- has_one :purchase



## purchases

|Column|Type        |Options                       |
|------|------------|------------------------------|
| item | references | foreign_key:true, null:false |
| user | references | foreign_key:true, null:false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase



## addresses

|Column         |Type        |Options                          |
|---------------|------------|---------------------------------|
| post_code     | string     | null:false                      |
| prefecture_id | integer    | null:false                      |
| city          | string     | null:false                      |
| building_name | string     |
| phone_number  | string     | null:false, unique:true         |
| purchase      | references | foreign_key:true, null:false    |

### Association

- belongs_to :purchase
