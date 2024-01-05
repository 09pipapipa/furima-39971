class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number,:item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Enter only half-width numerals with 10 to 11 digits" }
    validates :item
    validates :user_id
    validates :token
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id, street_address: street_address,
                   building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end