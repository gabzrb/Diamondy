class AddFieldsToStone < ActiveRecord::Migration[5.2]
  def change
    add_column :stones, :shape, :string
    add_column :stones, :symetry, :string
    add_column :stones, :polish, :string
    add_column :stones, :fluo, :string
  end
end
