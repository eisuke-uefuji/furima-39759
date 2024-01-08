class PurchaseDeliver
  include ActiveModel::Model
  attr_accessor  :user_id, :item_id, :post_number, :prefecture_id, :city, :street_line, :building, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id, :item_id, :purchase_id, :street_line, :city
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "電話番号は必須です"}
    validates :prefecture_id,  numericality: { other_than: 1, message: '----以外を選択してください。' }
  end

  def save
    purchase = Purchase.create(user_id: :user_id, item_id: :item_id)
    Deliver.create(post_number: :post_number, prefecture_id: :prefecture_id, city: :city, street_line: :street_line, building: :building, phone_number: :phone_number, purchase_id: :purchase.id)
  end
end