class AddMoneyToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price
    add_monetize :products, :price
  end
end
