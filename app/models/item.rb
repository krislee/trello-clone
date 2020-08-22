class Item < ApplicationRecord
  belongs_to :board

  validates_presence_of :item_name
end
