# WORKS
社員の勤怠管理システムです。  
出勤時間、退勤時間、休憩時間、コメントを登録できます。  
管理者として社員の勤怠記録の閲覧・編集も可能です。  
レスポンシブ対応しているので、PC、iPad・スマホからでも確認できます。

##### トップページ
![product-works_home](https://user-images.githubusercontent.com/78526536/128114093-84301c21-1698-4c54-ab30-232fd1245bd8.png)

## 作成の経緯
最終作成目標としているビル管理業務システムを作成するために必要な、スケジュール管理の基礎機能を実装する目的で作成しました。今回のポートフォリオから下記を学ぶことが出来ました。
- 管理ユーザーと一般ユーザーの機能分け
- 年月選択プルダウンから選択付きのデータを表示する機能
- Bootstrapベースのデザイン

## 使い方
社員ログインすると打刻用自動モーダルが表示されるので、出勤打刻押して登録します。  
※*出勤打刻をすることでモーダル自動表示は解除されます。*  
また、編集ボタンを押すと過去の記録を修正することができます。  
管理者は全ての社員の勤怠記録の閲覧・修正、ユーザー情報の編集ができます。

##### 勤怠一覧画面
![works_index](https://user-images.githubusercontent.com/78526536/129916335-5378f5a2-e90f-41ff-8b1e-f6731be0d330.png)

##### 年月選択プルダウン　　　　　　　　　　    打刻用モーダル
<img src="https://user-images.githubusercontent.com/78526536/129916896-ec239603-8ac1-420b-9a4f-75eca5e5f7f3.png" width="150">　　　　　　　　
<img src="https://user-images.githubusercontent.com/78526536/129915872-2007edd2-200b-4de3-8f6d-2b5b9a293ff3.png" width="320x320">

##### 社員一覧
![works_index](https://user-images.githubusercontent.com/78526536/129918238-0d3739b5-adec-4bbd-ac1d-2eb3b6c3e307.png)
## GitHub_URL
https://github.com/masa-self-learning/product-works
## APP_URL
https://product-works.herokuapp.com/

 - 社員ログイン
    - 1111 &ensp;&ensp; (社員番号)
    - 123456 (パスワード)
- 管理者ログイン
  - 0000&ensp;&ensp;(社員番号)
  - 123456 (パスワード)

## 使用技術
- Ruby 2.7.4
- Ruby on Rails 5.2.6
- PostgreSQL 11.12
- Puma
- Docker/Docker-compose
- Heroku

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 共通機能
  - プルダウン月選択
- 社員側機能
  - 出勤・退勤打刻、コメント入力
  - 勤怠記録編集
- 管理者
  - 社員・管理者の一覧表示・編集
  - 社員勤怠記録の閲覧・編集
