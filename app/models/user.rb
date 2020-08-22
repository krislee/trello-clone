class User < ApplicationRecord
  has_secure_password
  has_many :boards, dependent: :destroy
  has_many :lists, through: :boards
  has_many :items, through: :lists
  validates_presence_of :username, :password_digest
end
