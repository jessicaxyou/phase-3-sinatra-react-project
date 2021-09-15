class CreateElectronics < ActiveRecord::Migration[6.1]
  def change
    create_table :electronics do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :brand_id
    end
  end
end
