class Product < ApplicationRecord

  has_many :users, through: :footprints
  belongs_to :type
  belongs_to :brand
  geocoded_by :description::latitude: :lat, longitude: :lon
# end
  # after_validation :geocode,  if: ->(obj){ obj.country.present? and obj.country_changed? }
end
