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
  # raise
end

def close
  raise
  @game = Game.find(params[:id])
  @game.bets.each do |bet|
    # prize = Prize.new(winner_params)
  end

end




private

def game_params
 params.require(:game).permit(:title, :description, :price, :dead_line, :photo)
end

def winner_params
 params.require(:prize).permit(:ranking, :reward, :game, :user)
end



end
