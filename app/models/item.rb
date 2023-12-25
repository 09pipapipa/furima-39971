class Item < ApplicationRecord
  # has_one   :buy
  has_one_attached :image
  belongs_to :user

  validates :goods_name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :exposition,      presence: true
  validates :category_id,     presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :condition_id,    presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :cost_id,         presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id,   presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_date_id,presence: true, numericality: {other_than: 1, message: "can't be blank"}
  validates :image,           presence: true
end
