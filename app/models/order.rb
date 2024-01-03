class Order < ApplicationRecord
  
  validates :item, presences: true
  validates :user, presences: true
end
