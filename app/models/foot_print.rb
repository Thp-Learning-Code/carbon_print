class FootPrint < ApplicationRecord

  belongs_to :user
  belongs_to :product
  geocoded_by :location
  after_validation :geocode #if: :location_changed?

  def location
    [delivery_address,zip_code,town, country].compact.join(", ")
  end

  def location_changed?
    town.changed? || country.changed?
  end

end
