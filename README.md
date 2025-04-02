## users テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| username           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

### Association
- has_many :items


## categories テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |

### Association
- has_many :items


## shops テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |

### Association
- has_many :items


## items テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| on_the_list | boolean    | null: false                    |
| user        | references | null: false, foreign_key: true |
| category    | references | null: false, foreign_key: true |
| shop        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :shop