class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.decimal :carbon_print

      t.timestamps
    end
  end
end
