class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :telnum, :gender, :year ,presence: true

  # バリテーション カナ
  validates :last_name_kana, :first_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }

  # バリテーション 電話番号
  validates :telnum, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/} 

  has_one :address  
  has_many :items
end
