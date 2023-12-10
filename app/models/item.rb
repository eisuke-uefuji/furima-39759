class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :shipping_span
  belongs_to :user
  has_one_attached :image
  # has_one :purchase

  validates :name, presence: { message: '商品名を入力してください' }
  validates :item_summary, presence: { message: '商品の概要を入力してください' }
  validates :price, presence: { message: '価格を入力してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '販売価格は¥300から¥9,999,999の間でなければなりません' }
  validates :price, numericality: { only_integer: true, message: '販売価格は半角数字でなければなりません' }
  validates :image, presence:  { message: '画像をアップロードしてください' }
  validates :category_id, :condition_id, :delivery_charge_id, :shipping_span_id, :prefecture_id,
            numericality: { other_than: 1, message: '----以外を選択してください。' }
  validates :category_id, :condition_id, :delivery_charge_id, :shipping_span_id, :prefecture_id, presence: { message: 'は必ず選択してください。' }

end
