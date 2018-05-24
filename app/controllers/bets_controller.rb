class BetsController < ApplicationController
  def index
    @bets = Bet.all

  end
  def show
    @bet = Bet.find(params[:id])
  end
end
