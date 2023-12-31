FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 3)}#{Faker::Number.between(from: 100, to: 999)}" }
    password_confirmation { password }
    birthday              { '2000-01-01' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
  end
end
