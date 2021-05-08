# テーブル設計

## users テーブル
| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false  unique: true |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |

### Association

- has_many :jobs
- has_many :comments

## jobs テーブル
| Column          | Type       | Options                        |
| ----------------| -----------| -------------------------------|
| name            | string     | null: false                    |
| salary_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| work1_id        | integer    | null: false                    |
| work2_id        | integer    |                                |
| work3_id        | integer    |                                |
| test_month_id   | integer    | null: false                    |
| test_day_id     | integer    | null: false                    |
| test_id         | integer    | null: false                    |
| note            | text       | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## comments テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| think_id      | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| job           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :job