class Item < ApplicationRecord
  belongs_to :board
<<<<<<< HEAD
  validates_presence_of :item_name # excluding description & priority because user has the option to edit the item and add description and/or priority if user chooses to
end
=======

  validates_presence_of :item_name
end
>>>>>>> 1ead64cd832ba13d539193018940ad812fedb2ef
