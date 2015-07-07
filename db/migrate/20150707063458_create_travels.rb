class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.belongs_to :user
      t.belongs_to :travel
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
