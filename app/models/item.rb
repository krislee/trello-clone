<<<<<<< HEAD
class Item < ApplicationRecord
  belongs_to :board

end
=======
class Item < ApplicationRecord
  belongs_to :list
  belongs_to :board
  belongs_to :user

  validates_presence_of :item_name # excluding description & priority because user has the option to edit the item and add description and/or priority if user chooses to
end
>>>>>>> 908ef9a231114231f6719090f14679570df7c9d8
