class OrderAddress

  include ActiveModel::model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number,:item, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値のみ入力してください" }
    validates :item
    validates :user_id
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end