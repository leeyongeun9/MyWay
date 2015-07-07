class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :section
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
