class Game < ApplicationRecord
  has_many :prizes
  has_many :bets
end
