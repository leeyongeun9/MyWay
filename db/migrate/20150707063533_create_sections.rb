class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.belongs_to :route
      t.string :name
      t.string :start
      t.string :end
      t.string :date1
      t.string :date2

      t.timestamps
    end
  end
end
