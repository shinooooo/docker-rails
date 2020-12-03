# Usage
## 初回

### mysqlのパスワードを設定
```yaml
# docker-compose.
services:
  db:
    ⋮
    environment:
      MYSQL_ROOT_PASSWORD: **** #MySQLを起動する際パスワードを設定
```

### railsアプリの作成
```shell
  docker-compose run web rails new . --force --database=mysql --skip-test
```

### データベースの設定
`src/config/database.yml`を以下のように変更

```yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV.fetch("DB_USERNAME") { root } %>
  password: <%= ENV.fetch("DB_PASSWORD") { password } %>
  host: db
  ```

```shell
$ docker-compose build
$ docker-compose up -d
$ docker-compose run web rails db:create
```

 ### 動作確認

[ローカルサーバー](localhost:3000)にアクセスして　**Yay! You’re on Rails!**　と表示されていれば成功。

## その他のコマンド

### 停止
Ctrl + Cではなく下記コマンドで停止
```shell
$ docker-compose stop
```

## 2回目以降
## 起動。
```
$ docker-compose up -d
```

## コンテナが不要になった場合。
```shell
$ docker-compose down
```
