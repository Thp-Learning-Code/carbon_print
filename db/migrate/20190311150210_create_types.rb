class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name
      t.belongs_to :value, index: true
      t.timestamps
    end
  end
end
