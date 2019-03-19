class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :zip_code
      t.string :town
      t.string :facebook_id

      t.timestamps
    end
  end
end
