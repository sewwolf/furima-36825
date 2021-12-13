## Users テーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | -----------------------  |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| kana_first_name    | string | null: false              |
| kana_last_name     | string | null: false              |
| birthday           | date   | null: false              |

### association
- has_many :items
- has_many :records

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| detail             | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| postage            | integer    | null: false                    |
| area               | integer    | null: false                    |
| delivery_time      | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_one :record

## records テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| item_name | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresss テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | text       | null: false                    |
| municipality       | integer    | null: false                    |
| street_number      | integer    | null: false                    |
| building_name      | integer    | null: false                    |
| telephone_number   | integer    | null: false                    |
| delivery_time      | integer    | null: false                    |
| record             | references | null: false, foreign_key: true |

### association
- belongs_to :address

