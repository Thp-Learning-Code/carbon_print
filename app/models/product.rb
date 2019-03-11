class Product < ApplicationRecord

  has_many :users, through: :footprints
  
end
