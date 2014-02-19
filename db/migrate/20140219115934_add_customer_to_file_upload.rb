class AddCustomerToFileUpload < ActiveRecord::Migration
  def change
    add_column :fileuploads, :customer_id, :integer
  end
end
