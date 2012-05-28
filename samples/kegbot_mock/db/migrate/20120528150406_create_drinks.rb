class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :status
      t.double :volume_ml
      t.string :url
      t.integer :ticks
      t.string :session_id
      t.string :our_tie
      t.integer :duration
      t.string :keg_id

      t.timestamps
    end
  end
end
