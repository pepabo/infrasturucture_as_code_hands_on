# Infrastructure as Codeを学ぶ、実践的ハンズオン

GMOペパボ主催の「Infrastructure as Codeを学ぶ、実践的ハンズオン」の教材リポジトリです。

# オペレーション
## セットアップ
```
$ bundle install --binstubs --path vendor/bundle
```

## インスタンスの一覧
```
$ vagrant status
```

## インスタンスの起動
```
$ vagrant up www-1
```

# インスタンスのプロビジョニング
```
$ vagrant up www-1
```

# インスタンスのテスト
```
$ bin/rake spec:www-1
```
