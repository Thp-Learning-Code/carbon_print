class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :address
      t.string :country
      t.integer :zip_code
      t.string :city
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
