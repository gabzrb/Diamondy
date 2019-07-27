class ChangeSizeTypeInStones < ActiveRecord::Migration[5.2]
  def change
    change_column :stones, :size, :string
  end
end
