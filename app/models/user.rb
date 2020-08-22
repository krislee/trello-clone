class User < ApplicationRecord

  has_many :boards, dependent: :destroy
  has_many :items, through: :boards

  has_secure_password
end
