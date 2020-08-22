
class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  belongs_to :user

<<<<<<< HEAD
  validates_presence_of :board
=======
  validates_presence_of :board_name
>>>>>>> b75aa1a78fdc89ee79e42e7d41bbbf886b80bc11
end

