class AddObjetToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :objet, :string
  end
end
