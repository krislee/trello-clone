<<<<<<< HEAD
class User < ApplicationRecord

  has_many :boards, dependent: :destroy
  has_many :items, through: :boards

  has_secure_password
end
=======
class User < ApplicationRecord
  has_secure_password
  has_many :boards, dependent: :destroy
  has_many :lists, through: boards
  has_many :items, through: :lists
  validates_presence_of :username, :password_digest
end
>>>>>>> 908ef9a231114231f6719090f14679570df7c9d8
