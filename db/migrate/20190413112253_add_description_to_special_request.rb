class AddDescriptionToSpecialRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :special_requests, :type, :string
  end
end
