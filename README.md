## usersテーブル

| Column | Type          | Options                        |
| ------ | ----------    | ------------------------------ |
| nickname               | string | null: false |
| email                  | string | null: false, unique:true |
| encrypted_password     | string | null: false |
| familyname_kanji       | string | null: false |
| firstname_kanji        | string | null: false |
| familyname_kana        | string | null: false |
| firstname_kana         | string | null: false |
| birthdate              | date | null: false |


### Association
- has_many :items
- has_many :purchases
- has_many :delivers


## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name                  | string | null: false |
| condition             | string | null: false |
| delivery_charge       | string | null: false |
| shipping_span         | string | null: false |
| shipping_area          | string | null: false |
| image                 | string | null: false |
| user   | references | null: false, foreign_key: true |
| purchase  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price               | string | null: false |
| user   | references | null: false, foreign_key: true |
| deliver  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :deliver

## deliversテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address               | string | null: false |
| post_number            | string | null: false |
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase