class AddCityToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :city, :string
  end
end
