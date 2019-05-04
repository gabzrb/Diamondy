class ChangeTypeInProduct < ActiveRecord::Migration[5.2]
  def change
      rename_column :products, :type, :element
  end
end
