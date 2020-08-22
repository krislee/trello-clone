class Item < ApplicationRecord
  belongs_to :list
  belongs_to :board
  belongs_to :user

  validates_presence_of :item_name # excluding description & priority because user has the option to edit the item and add description and/or priority if user chooses to
end
