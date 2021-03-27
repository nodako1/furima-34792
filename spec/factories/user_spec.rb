FactoryBot.define do
  factory :user do
    email { 'test@test' }
    password { 'aaa111' }
    nick_name { 'furima太朗' }
    first_name { '太朗' }
    last_name { '山田' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { '1990-01-01' }
  end
end