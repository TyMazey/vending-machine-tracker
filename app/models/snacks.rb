class Snacks < ApplicationRecord
  validate_presence_of :name, :price

  has_many :machines
end
