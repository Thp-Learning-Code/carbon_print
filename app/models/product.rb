class Product < ApplicationRecord

  has_many :users, through: :footprints
  belongs_to :type
  belongs_to :brand
  geocoded_by :address#::latitude: :lat, longitude: :lon

  after_validation :geocode , if: :address_changed?

  def address
    [city,description].compact.join(",")
  end
  
  def address_changed?
    city_changed? || description_changed?

  end

end
