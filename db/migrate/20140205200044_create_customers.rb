class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :location
      t.integer :postal
      t.string :street
      t.string :straatNr

      t.timestamps
    end
  end
end
