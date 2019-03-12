class CreateRatios < ActiveRecord::Migration[5.2]
  def change
    create_table :ratios do |t|
      t.decimal :carbon_print_for_brand

      t.timestamps
    end
  end
end
