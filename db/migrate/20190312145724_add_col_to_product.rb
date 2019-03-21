class AddColToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :result, :decimal
  end
end
