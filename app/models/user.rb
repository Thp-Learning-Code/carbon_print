class User < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :zip_code, presence: true
  has_many :products, through: :footprints
  
end
