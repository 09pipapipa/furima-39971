class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number,:item_id, :user_id, :token

  with_options presence: true do
    validates :prefecture_id,    numericality: {other_than: 1, message: "を入力してください"}
    validates :postal_code,      format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフンを(-)入力してください" }
    validates :phone_number,     format: { with: /\A\d{10,11}\z/, message: "10桁から11桁の半角数字のみを入力してください" }
    validates :street_address
    validates :item_id
    validates :user_id
    validates :city
    validates :token
  end
  
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id, street_address: street_address,
                   city: city,building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end