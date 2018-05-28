class GamesController < ApplicationController

  def index
    @games = Game.all.where(:user == current_user)
  end

  def new
    @game = Game.new
  end

  def create
  # binding.pry
    @game = Game.new(game_params)
    @bet = Bet.new
    @bet.user = current_user
    @bet.challenger = true
    @bet.game = @game
      if @game.save && @bet.save
       redirect_to invite_path(@game)
      else
       render :new
      end
  end

  def ongoing
    @game.ongoing!
  end

  def closed
    @game.closed!
  end


def invite; end


  def save_invite
    # raise
    @game = Game.find(params[:id])
    email = params[:user][:email]
    user = User.invite!(email: email)
    bet = Bet.new(user: user, game: @game, status: "pending", challenger: false)
      if bet.save
        redirect_to bet_path(bet)
      else
        render :invite
      end
  end

  def show
    @game = Game.find(params[:id])
  end



  def winners
    @game = Game.find(params[:id])
    @game.prizes.build

    @ranking_possibilities = if @game.winner?
      [["Perdant", 0],["Gagnant", 1]]
    else
      [["Perdant", 0] ,["1er",1] ,["2nd",2], ["3ème", 3]]
    end
  end
  # raise


def close
  @game = Game.find(params[:id])
  # @game = Game.new
  # @game.prizes.build

  if @game.update(game_params)
    @total_reward = @game.bets.ongoing.count * @game.price
    success = true
    prizes = @game.prizes.where(ranking:(1..3))

    prizes.each do |prize|
      prize.reward = @total_reward / prizes.count
      success = false unless prize.save
    end
    @game.closed!
    if success
      redirect_to resume_path
    else
      flash[:alert] = "Error during calculating rewards"
    render :winners
    end
  else
    flash[:alert] = "Error durring saving prizes"
    render :winners
  end
end
# @place.update_attributes(place_params)
# >>  params["game"][:prizes_attributes]["0"][:ranking]

def resume_challenge
  @game = Game.find(params[:id])
  @bets = @game.bets
  @bets.each do |bet|
    if bet.user == current_user
      redirect_to bet_path(bet)
    end
  end
  # redirect_to bet_path(@bets.first)
end

# @place.update_attributes(place_params)
# >>  params["game"][:prizes_attributes]["0"][:ranking]

# def resume_challenge
#   @game = Game.find(params[:id])
#   @total_reward = @game.bet.ongoing.count * @game.price
#   @game.bet.ongoing.each do |beter|
#     beter.reward = @total_reward / (@game.prizes(WHERE ranking = 1))
#   end




private


def game_params
 params.require(:game).permit(:id, :title, :description, :price, :dead_line,:category,:status, :photo, prizes_attributes: [:ranking, :reward, :game, :user_id])
end


  def prize_params
    params.require(:prize).permit(:ranking, :reward, :game, :user)
  end

end


