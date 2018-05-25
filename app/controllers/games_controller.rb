class GamesController < ApplicationController

def index
  @games = Game.all.where(:user == current_user)
end

def new
  @game = Game.new

end

def create
  # raise
  @game = Game.new(game_params)
  @game.status = "pending"
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


def invite; end


def save_invite
  # raise
 @game = Game.find(params[:id])
 email = params[:user][:email]
 user = User.invite!(email: email)
 bet = Bet.new(user: user, game: @game, status: "pending", challenger: false)
 if bet.save
  redirect_to game_path(@game)
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
    [0,1,2,3]
  end

  # raise
end

def close
  # raise
  @game = Game.find(params[:id])
  # @game = Game.new
  # @game.prizes.build
  @game.update_attributes(game_params)
  redirect_to resume_path(@game)
end
# @place.update_attributes(place_params)
# >>  params["game"][:prizes_attributes]["0"][:ranking]

# def resume_challenge
#   @game = Game.find(params[:id])
#   @total_reward = @game.bet.ongoing.count * @game.price
#   @game.bet.ongoing.each do |beter|
#     beter.reward = @total_reward / (@game.prizes(WHERE ranking = 1))
#   end
end


private

def game_params
 params.require(:game).permit(:id, :title, :description, :price, :dead_line, :photo, prizes_attributes: [:ranking, :reward, :game, :user])
end

def prize_params
 params.require(:prize).permit(:ranking, :reward, :game, :user)
end




