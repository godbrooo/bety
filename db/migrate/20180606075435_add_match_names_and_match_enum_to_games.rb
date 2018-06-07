class AddMatchNamesAndMatchEnumToGames < ActiveRecord::Migration[5.1]
  def change

    add_column :games, :name_a, :string
    add_column :games, :name_b, :string
    add_column :games, :match_challenger_bet, :integer, default: 0
    add_column :bets, :match_bet, :integer, default: 0
  end
end
