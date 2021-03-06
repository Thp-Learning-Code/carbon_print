class CreateFootprints < ActiveRecord::Migration[5.2]
  def change
    create_table :footprints do |t|

      t.string :delivery_address
      t.integer :zip_code
      t.string :town
      t.string :country
      t.float :latitude
      t.float :longitude
      t.decimal :result
      t.belongs_to :user, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
