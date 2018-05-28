class BetsController < ApplicationController
  def index
    @bets_pending = current_user.bets.pending
    @bets_ongoing = current_user.bets.ongoing
    @bets_closed = current_user.bets.closed


  end
  def show
    @bet = Bet.find(params[:id])
  end

  def participate
    @bet = Bet.find(params[:id])
    @bet.ongoing!
    redirect_to bets_path
  end

  def denied
    @bet = Bet.find(params[:id])
    @bet.refused!
    redirect_to bets_path
  end
  def close_bets
    @bet = Bet.find(params[:id])
    @bet.game.ongoing!
    @bet.game.bets.each do |bet|
      if bet.status != "ongoing"
      bet.refused!
      end
    end
    redirect_to bets_path
  end
end
