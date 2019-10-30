class AddAuthorizationToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :annonces, :checked, :boolean, default: false
    add_column :products, :checked, :boolean, default: false
  end
end
