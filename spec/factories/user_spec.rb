FactoryBot.define do
  factory :user do
    email { 'test@test' }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nick_name { '田中' }
    first_name { '太郎' }
    last_name { '田中' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { Faker::Date.backward }
  end
  factory :existed_user do
    email { 'test@test' }
  end
end
