class List < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :board

  validates_presence_of :list_name
end
