class CreateCustomersUsers < ActiveRecord::Migration
  def change
    create_table :customers_users do |t|
      t.belongs_to :customer
      t.belongs_to :user
    end
  end
end
