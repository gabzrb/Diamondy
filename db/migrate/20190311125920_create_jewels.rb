class CreateJewels < ActiveRecord::Migration[5.2]
  def change
    create_table :jewels do |t|
      t.string :category
      t.string :state
      t.string :brand
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
