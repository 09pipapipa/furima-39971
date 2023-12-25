FactoryBot.define do
  factory :item do
    association :user

    goods_name        { '商品名' }
    price             { 500 }
    exposition        { '商品説明' }
    category_id       { 2 }
    condition_id      { 2 }
    cost_id           { 2 }
    prefecture_id     { 2 }
    delivery_date_id  { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Cat03.jpg'), filename: 'Cat03.jpg')
    end
  end
end
