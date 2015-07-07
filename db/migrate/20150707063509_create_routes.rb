class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.belongs_to :travel
      t.string :name
      t.string :date1
      t.string :date2
      t.text :description
      t.string :photo
      t.string :point
      
      t.timestamps
    end
  end
end
