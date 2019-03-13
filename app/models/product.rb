class Product < ApplicationRecord

  has_many :users, through: :footprints
  belongs_to :type
  belongs_to :brand
  geocoded_by :location
  after_validation :geocode

  def location
    [city, country].compact.join(", ")
  end
end
