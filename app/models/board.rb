class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  belongs_to :user

  validates_presence_of :board_name
end
