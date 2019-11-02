class AddCertAttachementToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :stones, :cert_attachment, :string
  end
end
