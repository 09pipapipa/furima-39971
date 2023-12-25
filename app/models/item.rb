class Item < ApplicationRecord
  extend ActiveHash::Association::ActiveRecordExtensions
  # has_one   :buy
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :delivery_date

  validates :goods_name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :exposition,      presence: true
  validates :category,        presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :cost,            presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date,   presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
end