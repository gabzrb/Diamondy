class CreateStones < ActiveRecord::Migration[5.2]
  def change
    create_table :stones do |t|
      t.string :category
      t.integer :size
      t.float :weight
      t.string :color
      t.string :purity
      t.string :certificate
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
