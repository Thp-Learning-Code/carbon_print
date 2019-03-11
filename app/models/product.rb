class Product < ApplicationRecord

  has_many :users, through: :footprints
  belongs_to :type
end
