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
  if @game.save
     @bet = Bet.new(game_id: @game.id,user_id: current_user.id)
     @bet.save
   redirect_to game_path(@game)
  else
   render :new
  end
end

def show
  @game = Game.find(params[:id])
end



private

def game_params
 params.require(:game).permit(:title, :description, :price, :dead_line, :photo)
end



end
