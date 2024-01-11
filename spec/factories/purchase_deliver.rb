FactoryBot.define do
  factory :purchase_deliver do
    post_number {'777-1111'}
    prefecture_id { 2 }
    city {'京都'}
    street_line {'四条1丁目'}
    building {'ああああ'}
    phone_number {'0900000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end