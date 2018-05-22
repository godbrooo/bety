class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prizes
  has_many :bets
  has_many :games, through: :bets

  validates :bets, uniqueness: { scope: :game,
    message: "should bet only one time per game" }

end
