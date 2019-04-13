class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_name, :string
    add_column :users, :siret_no, :string
    add_column :users, :services_description, :text
    add_column :users, :newsletter, :boolean
    add_column :users, :offers, :boolean
  end
end
