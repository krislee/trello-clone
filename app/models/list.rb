class List < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :board
<<<<<<< HEAD
  validates_presence_of :list_name # needs a name for the list to actually make the list (e.g. Things To Do, Doing, and Done are all list names)
=======

  validates_presence_of :list_name
>>>>>>> 1ead64cd832ba13d539193018940ad812fedb2ef
end
