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
| item_summary            | text    | null: false |
| price                   | integer | null: false |
| category_id             | integer | null: false |
| condition_id            | integer | null: false |
| delivery_charge_id      | integer | null: false |
| shipping_span_id        | integer | null: false |
| shipping_area_id        | integer | null: false |
| user                    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_one_attached :image

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :deliver

## deliversテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_number         | string | null: false |
| prefecture          | integer | null: false |
| city                | string | null: false |
| street_line         | string | null: false |
| building            | string | null: false |
| phone_number        | string | null: false |
| purchase            | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase