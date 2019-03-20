class Footprint < ApplicationRecord
  validates :zip_code, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true

  belongs_to :user
  belongs_to :product
  
  geocoded_by :location
  after_validation :geocode #if: :location_changed?

  def location
    [town, country].compact.join(", ")
  end

  def location_changed?
    town.changed? || country.changed?
  end
  
end
