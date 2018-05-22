class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.integer :price
      t.string :status
      t.datetime :dead_line

      t.timestamps
    end
  end
end
