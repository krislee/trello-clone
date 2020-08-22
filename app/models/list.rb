class List < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :board
  belongs_to :user
  validates_presence_of :list_name # needs a name for the list to actually make the list (e.g. Things To Do, Doing, and Done are all list names)
end
