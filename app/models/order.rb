class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one    :address
  
  validates :item, presence: true
  validates :user, presence: true
end
