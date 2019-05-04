class AddPhotosToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :photo1, :string
    add_column :products, :photo2, :string
    add_column :products, :photo3, :string
  end
end
