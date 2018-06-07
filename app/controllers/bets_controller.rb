class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @bets = current_user.bets
    @bets_pending = current_user.bets.pending
    @bets_ongoing = current_user.bets.ongoing
    @bets_closed = current_user.bets.closed

     @reward = Prize.where(user: current_user).where.not(reward: nil).map(&:reward).reduce(:+)
     if @reward == nil
      @reward = 0
    end
  end

  def show
   @bet = Bet.find(params[:id])
  end

  def pari_a
    @bet = Bet.find(params[:id])
    @bet.equipe_a_gagne!
    @bet.ongoing!
    redirect_to bet_path
    # redirect_to betsencours_path
  end

  def pari_b
    @bet = Bet.find(params[:id])
    @bet.equipe_b_gagne!
    @bet.ongoing!
    redirect_to bet_path
    # redirect_to betsencours_path
  end

  def match_nul
    @bet = Bet.find(params[:id])
    @bet.match_nul!
    @bet.ongoing!
    redirect_to bet_path
    # redirect_to betsencours_path
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
