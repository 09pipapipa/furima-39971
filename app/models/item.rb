class Item < ApplicationRecord
  #has_one   :buy
  has_one_attached :image
  belongs_to :user

  validates :goods_name,presence: true
  validates :price,presence: true,numericality: { greater_than: 0}
  validates :exposition,presence: true
  validates :category_id,presence: true
  validates :condition_id,presence: true
  validates :cost_id,presence: true
  validates :prefecture_id,presence: true
  validates :delivery_date_id,presence: true
end
