class CreateFileuploads < ActiveRecord::Migration
  def change
    create_table :fileuploads do |t|
      t.string :dbfile

      t.timestamps
    end
  end
end
