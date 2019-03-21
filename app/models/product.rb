class Product < ApplicationRecord
  validates :type_id, presence: true
  validates :brand_id, presence: true
  validates :warehouse_id, presence: true
  has_many :footprints
  has_many :users, through: :footprints
  belongs_to :type

  belongs_to :warehouse

  belongs_to :brand


  def tx_total
    brand.ratio.carbon_print_for_brand * type.value.carbon_print
  end

end
