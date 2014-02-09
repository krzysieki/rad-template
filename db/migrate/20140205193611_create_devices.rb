class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :serial
      t.string :name
      t.integer :height
      t.integer :width
      t.integer :top
      t.integer :left
      t.string :screentype
      t.string :os
      t.string :ip
      t.string :location

      t.timestamps
    end
  end
end
