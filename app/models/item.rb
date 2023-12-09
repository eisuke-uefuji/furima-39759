class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture


  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name, :item_summary, :price, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, :shipping_span_id, :prefecture_id, numericality: { other_than: 1 ,message: "can`t be blank"}

end
