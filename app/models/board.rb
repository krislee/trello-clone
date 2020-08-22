<<<<<<< HEAD
class Board < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
end
=======
class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  belongs_to :user

  validates_presence_of :board_title # needs to have a title for the board to actually form the board
end
>>>>>>> 908ef9a231114231f6719090f14679570df7c9d8
