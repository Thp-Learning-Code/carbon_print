class Product < ApplicationRecord

  has_many :users, through: :footprints
  belongs_to :type
  belongs_to :brand
  geocoded_by :location
  after_validation :geocode

  def location
    [city, country].compact.join(", ")
  end

  def tx_total
    brand.ratio.carbon_print_for_brand * type.value.carbon_print
  end

end
