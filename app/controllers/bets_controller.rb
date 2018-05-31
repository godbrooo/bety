class BetsController < ApplicationController
  def index
    @bets = current_user.bets
    @bets_pending = current_user.bets.pending
    @bets_ongoing = current_user.bets.ongoing
    @bets_closed = current_user.bets.closed

     @reward = Prize.where(user: current_user).where.not(reward: nil).map(&:reward).reduce(:+)
  end

  def show
   @bet = Bet.find(params[:id])
  end

  def participate
    @bet = Bet.find(params[:id])
    @bet.ongoing!
    redirect_to bet_path
    # redirect_to betsencours_path
  end

  def denied
    @bet = Bet.find(params[:id])
    @bet.refused!
    redirect_to bet_path
  end

  def close_bets
    @bet = Bet.find(params[:id])
    @bet.game.ongoing!
      @bet.game.bets.each do |bet|
        if bet.status != "ongoing"
          bet.refused!
        end
    end
    redirect_to bet_path
  end

end
