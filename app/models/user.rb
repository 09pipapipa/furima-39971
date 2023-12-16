class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  validates :nickname,              presence: true
  validates :password,              presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).*\z/ }
  validates :password_confirmation, presence: true, if: :password_required?
  validates :birthday,              presence: true
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :first_name_kana,       presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

end
