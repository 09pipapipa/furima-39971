FactoryBot.define do
  factory :order_address do

    token            { "tok_abcde00000000000" }
    postal_code      { '123-4567'}
    prefecture_id    { 2 }
    city             { '世田谷区' }
    street_address   { '多摩川1-1-1' }
    building_name    { '町田ビル106' }
    phone_number     { '09099998888' }
  end
end
