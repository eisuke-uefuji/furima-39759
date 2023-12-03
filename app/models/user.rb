class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :familyname_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/}
  validates :firstname_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/}
end
