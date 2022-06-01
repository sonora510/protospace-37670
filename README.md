*練習用DB テーブル名  
カラム名  
カラムの型  
カラムのオプション  

**usersテーブル
|Column|Type|Options|
| ---- | -- | ----- |
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|profile|text|null: false|
|occupation|text|null: false|
|position|text|null: false|

**prototypeテーブル
|Column|Type|Options|
| ---- | -- | ----- |
|title|string|null: false|
|catch_copy|text|null: false|
|concept|text|null: false|
|user|references|null: false|

**commentsテーブル
|Column|Type|Options|
| ---- | -- | ----- |
|content|text|null: false|
|prototype|references|null: false|
|user|references|null: false|