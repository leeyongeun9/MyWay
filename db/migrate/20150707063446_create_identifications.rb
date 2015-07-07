class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|

      t.timestamps
    end
  end
end
