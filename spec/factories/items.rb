FactoryBot.define do
  factory :item do
    name  { Faker::Commerce.product_name }
    item_summary { Faker::Lorem.sentence }
    price { rand(300..9_999_999) }
    association :user
    category_id { rand(2..Category.count) }
    condition_id { rand(2..Condition.count) }
    delivery_charge_id { rand(2..DeliveryCharge.count) }
    shipping_span_id { rand(2..ShippingSpan.count) }
    prefecture_id { rand(2..Prefecture.count) }

    after(:build) do |item|
      image_path = '/home/eisukeuefuji/projects/furima-39759/app/assets/images/card-visa.gif'
      item.image.attach(io: File.open(image_path), filename: 'card-visa.gif', content_type: 'image/gif')
    end
  end
end
