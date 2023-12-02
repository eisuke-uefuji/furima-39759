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


## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name                    | string  | null: false |
| category_id             | integer | null: false |
| condition_id            | integer | null: false |
| delivery_charge_id      | integer | null: false |
| shipping_span_id        | integer | null: false |
| shipping_area_id        | integer | null: false |
| user                    | references | null: false, foreign_key: true |

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
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase