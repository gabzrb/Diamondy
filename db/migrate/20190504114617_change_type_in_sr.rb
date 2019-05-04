class ChangeTypeInSr < ActiveRecord::Migration[5.2]
  def change
    rename_column :special_requests, :type, :description
  end
end
