FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_kanji     { Gimei.last.kanji }
    first_name_kanji      { Gimei.first.kanji }
    family_name_kana      { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              {Faker::Date.birthday(min_age: 4, max_age: 80).strftime('%Y-%m-%d')}
  end
end