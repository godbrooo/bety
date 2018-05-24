class ChangeStatustoToEnumAndAddCategorytoGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :status, :string
    add_column :games, :status, :integer, default: 0
    add_column :games, :category, :integer, default: 0
  end
end
