class Warehouse < ApplicationRecord
  has_many :products

  geocoded_by :address
  after_validation :geocode

  def address
    [city,country].compact.join(', ')
  end

end
