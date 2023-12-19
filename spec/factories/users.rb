FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test'}
    password              {'abc123'}
    password_confirmation {'abc123'}
    encrypted_password    {'abc123'}
    birthday              {'2000-01-01'}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}

  end
end