class AddFieldToWatch < ActiveRecord::Migration[5.2]
  def change
    add_column :watches, :box, :boolean, default: false
    add_column :watches, :paper, :boolean, default: false
  end
end
