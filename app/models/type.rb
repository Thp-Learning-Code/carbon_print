class Type < ApplicationRecord
  has_many :products
  belongs_to :value
end
