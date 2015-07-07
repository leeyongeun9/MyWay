class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.belongs_to :album
      t.string :image
      t.string :title
      t.text :diary
      t.string :date

      t.timestamps
    end
  end
end
