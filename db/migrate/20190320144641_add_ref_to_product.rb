class AddRefToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :warehouse, foreign_key: true
  end
end
