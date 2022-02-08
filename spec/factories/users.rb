FactoryBot.define do
  factory :user do
    nickname              {'furima太郎'}
    email                 {Faker::Internet.free_email}
    password              {'a12345'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    date_of_birth         {'2000-01-01'}
  end
end
