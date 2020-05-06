# 初回起動

## プロジェクト作成
```shell
$ docker-compose run web rails new . --force --database=mysql --skip-bundle
```

## データベースの設定

```shell
$ vi src/config/database.yml
```

以下のように変更

```yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password # docker-compose.ymlに記述したMYSQL_ROOT_PASSWORD
  host: db # docker-compose.ymlに記述したservice
```

## Docker起動

```shell
$ docker-compose up -d
```

## データベース作成
新規ターミナルを開き、プロジェクトのディレクトリで下記コマンドを実行
```shell
$ docker-compose run web rails db:create
```

 ## 動作確認


[ローカルサーバー](localhost:3000)にアクセスして　**Yay! You’re on Rails!**　と表示されていれば成功。

# その他のコマンド

## 停止
Ctrl + Cではなく下記コマンドで停止
```shell
$ docker-compose stop
```

# 2回目以降の起動
下記コマンドのみで起動可能。
```
$ docker-compose up -d
```

# イメージの削除
プロジェクトのディレクトリが不要になった場合。
```shell
$ docker-compose down
```
