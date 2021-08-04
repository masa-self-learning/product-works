# WORKS
社員の勤怠管理システムです。  
出勤時間、退勤時間、休憩時間、コメントを登録できます。  
管理者として社員の勤怠記録の閲覧・編集も可能です。  
レスポンシブ対応しているので、PC、iPad・スマホからでも確認できます。

![product-works_home](https://user-images.githubusercontent.com/78526536/128114093-84301c21-1698-4c54-ab30-232fd1245bd8.png)

## 作成の経緯
YouTubeの講座を参考にさせていただきました。  
講座内ではPHPで作成していたものをRuby on Railsで書き換えて実装しました。  
私が最終作成目標としているビル管理業務システムを作成するために必要な、スケジュール管理の基礎となる考え方が詰まっていたのでポートフォリオの第一弾として選択しました。

## 使い方
社員ログインすると自動モーダルが表示されるので、出勤打刻押して登録します。(出勤打刻するとモーダル自動表示は解除されます。)  
また、編集ボタンを押すと過去の記録を修正することができます。  
管理者は社員勤怠記録の閲覧・修正、社員情報の編集ができます。

![modal](https://user-images.githubusercontent.com/78526536/128116385-723be946-f62c-4c21-9748-70fa751eb871.png)

![works_index](https://user-images.githubusercontent.com/78526536/128116427-ea8efe1b-eaec-494a-b89f-a7427cee8622.png)

## URL
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
