class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :title
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
