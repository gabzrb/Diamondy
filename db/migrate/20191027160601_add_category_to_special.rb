class AddCategoryToSpecial < ActiveRecord::Migration[5.2]
  def change
    add_column :special_requests, :categorie, :string
  end
end
