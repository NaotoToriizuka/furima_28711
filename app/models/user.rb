class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  str_full_jp = /\A[ぁ-んァ-ン一-龥]/
  str_full_kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}+\z/i, message: "Include both letters and numbers"}
    validates :last_name, format: { with: str_full_jp, message: "Full-width characters"}
    validates :first_name, format: { with: str_full_jp, message: "Full-width characters"}
    validates :last_name_kana, format: { with: str_full_kana, message: "Full-width katakana characters"}
    validates :first_name_kana, format: { with: str_full_kana, message: "Full-width katakana characters"}
    validates :birth_day
  end

  has_many  :items
  has_many  :purchases
  
end
