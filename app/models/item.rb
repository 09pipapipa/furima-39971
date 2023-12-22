class Item < ApplicationRecord
#has_one   :buy
has_one_attached :image
belongs_to :user
end
