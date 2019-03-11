class CreateFootPrints < ActiveRecord::Migration[5.2]
  def change
    create_table :foot_prints do |t|
      t.string :delivery_address
      t.integer :zip_code
      t.string :town
      t.decimal :result
      t.belongs_to :user, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
