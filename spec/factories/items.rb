FactoryBot.define do
  factory :item do
    name  { Faker::Commerce.product_name }
    item_summary { Faker::Lorem.sentence }
    price { rand(300..9999999)}
    image { Faker::Lorem.sentence }
    association :user
    association :category
    association :condition
    association :delivery_charge
    association :shipping_span
    association :prefecture 
  end
end
