FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    familyname_kanji {"上藤"}
    firstname_kanji {"英資"}
    familyname_kana {"ウエフジ"}
    firstname_kana {"エイスケ"}
    birthdate {Faker::Date.backward}
  end
end