class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :adress
      t.string :country
      t.string :city
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
