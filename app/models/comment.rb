class Comment < ApplicationRecord
  belongs_to :user #usersテーブルとのアソシエーション
  belongs_to :prototype #prototypeテーブルとのアソシエーショn

  validates :text, presence: true
end
