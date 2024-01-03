class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one    :address
  
  validates :item, presences: true
  validates :user, presences: true
end
