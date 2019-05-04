class CreateAnnonces < ActiveRecord::Migration[5.2]
  def change
    create_table :annonces do |t|
      t.string :category
      t.text :description

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
