class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :familyname_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/ }
  validates :birthdate, presence: true
  validates :nickname, presence: true
  validates :familyname_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :firstname_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合で入力してください' }

  has_many :items
  has_many :purchases

end
