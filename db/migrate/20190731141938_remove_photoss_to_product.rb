class RemovePhotossToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :photo
    remove_column :products, :photo1
    remove_column :products, :photo2
    remove_column :products, :photo3
  end
end
