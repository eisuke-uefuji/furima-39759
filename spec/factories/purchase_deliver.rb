FactoryBot.define do
  factory :purchase_deliver do
    item_id { 1 }
    post_number {'777-1111'}
    prefecture_id { 2 }
    city {'京都'}
    street_line {'四条1丁目'}
    building {'ああああ'}
    phone_number {'0900000000'}
    purchase_id { 1 }
  end
end