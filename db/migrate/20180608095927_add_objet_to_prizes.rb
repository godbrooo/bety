class AddObjetToPrizes < ActiveRecord::Migration[5.1]
  def change
    add_column :prizes, :objet, :string
  end
end
