class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :shipping_span
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name, presence: { message: '商品名を入力してください' }
  validates :item_summary, presence: { message: '商品の概要を入力してください' }
  validates :price, presence:  { message: '価格を入力してください' }
  validates :image, presence:  { message: '画像をアップロードしてください' }
  validates :category_id, :condition_id, :delivery_charge_id, :shipping_span_id, :prefecture_id,
            numericality: { other_than: 1, message: 'can`t be blank' }
end
