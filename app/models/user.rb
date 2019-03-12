class User < ApplicationRecord

  has_many :products, through: :footprints

  
end
