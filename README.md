## アプリケーション名 
Enjob-CE(仮)

## アプリケーション概要
関東圏の臨床工学技士の求人をまとめた大学専用サイト
ユーザー登録をすると求人情報を登録することができます。
登録した求人情報は削除・編集が可能です。


# URL

## テスト用アカウント
メールアドレス： sss@sss
パスワード： 67yu67yu

## 利用方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページからNew Job →求人投稿 → 保存する
確認後、ログアウト処理をお願いします。

## 目指した課題解決
臨床工学技士の求人サイトをまとめたものがなく、様々なサイトを閲覧しなくていけないこと、
新卒・中途の求人がいり混じっているので効率が悪いことが挙げられます。

## 洗い出した要件
# トップページ
【ボタン】
サインイン/ログアウトへ遷移できるボタンがある
ログイン時はログアウトができるボタンがある
ログイン時はNewJob(求人投稿)ができるボタンがある
求人を検索できるボタンがある

【表示】
新規投稿された求人を見ることができる
投稿したユーザの名前を見ることができる

# 詳細ページ
【ボタン】
投稿者は削除/編集ボタンがある
コメントを送信できるボタンがある
サインイン/ログアウトへ遷移できるボタンがある
ログイン時はログアウトができるボタンがある
ログイン時はNewJob(求人投稿)ができるボタンがある

【表示】
求人の詳細を見ることができる
投稿したユーザの名前を見ることができる
googleフォームを送ることができる
コメントを見ることができる

# 求人投稿
【ボタン】
求人投稿を保存するボタンがある
サインイン/ログアウトへ遷移できるボタンがある
ログイン時はログアウトができるボタンがある
ログイン時はNewJob(求人投稿)ができるボタンがある

【表示】
求人投稿フォームがある

# 編集ページ
【ボタン】
編集を保存するボタンがある
サインイン/ログアウトへ遷移できるボタンがある
ログイン時はログアウトができるボタンがある
ログイン時はNewJob(求人投稿)ができるボタンがある

【表示】
求人編集フォームがある

## 実装した機能について
# ログイン/ログアウト機能
[![Image from Gyazo](https://i.gyazo.com/344d0e8c2f1e78761cc4c0328552edc0.gif)](https://gyazo.com/344d0e8c2f1e78761cc4c0328552edc0)

# 求人投稿機能
[![Image from Gyazo](https://i.gyazo.com/eb65edb1ba9ede24e598f378ee6c11d1.gif)](https://gyazo.com/eb65edb1ba9ede24e598f378ee6c11d1)

# 求人検索機能
[![Image from Gyazo](https://i.gyazo.com/78ad3b20dc1a1e48b69eff71599ce857.gif)](https://gyazo.com/78ad3b20dc1a1e48b69eff71599ce857)

# 求人情報編集/削除機能
[![Image from Gyazo](https://i.gyazo.com/eeefb58cbf4963cca2732c79a7614317.gif)](https://gyazo.com/eeefb58cbf4963cca2732c79a7614317)



# 実装予定の機能
コメント機能
アドミンユーザー/一般ユーザーの区別
自動求人削除機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/6787b6d4cee6d35feea302b610ceb437.png)](https://gyazo.com/6787b6d4cee6d35feea302b610ceb437)

# 

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
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone           | string     | null: false                    |
| map             | text       |                                |
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