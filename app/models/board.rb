
class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  belongs_to :user

  validates_presence_of :board_title # needs to have a title for the board to actually form the board
end

