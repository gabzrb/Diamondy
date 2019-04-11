class CreateWatches < ActiveRecord::Migration[5.2]
  def change
    create_table :watches do |t|
      t.string :state
      t.string :brand
      t.string :model
      t.string :year
      t.string :material
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
