class CreateCustomersPlaylists < ActiveRecord::Migration
  def change
    create_table :customers_playlists do |t|
      t.belongs_to :customer
      t.belongs_to :playlist
    end
  end
end
