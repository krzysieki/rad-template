class CreateCustomersDevices < ActiveRecord::Migration
  def change
    create_table :customers_devices do |t|
          t.belongs_to :customer
          t.belongs_to :device
    end
  end
end
