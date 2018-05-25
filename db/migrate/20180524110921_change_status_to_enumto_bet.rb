class ChangeStatusToEnumtoBet < ActiveRecord::Migration[5.1]
  def change
    remove_column :bets, :status, :string
    add_column :bets, :status, :integer, default: 0
  end
end
