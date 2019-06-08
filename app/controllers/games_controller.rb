class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      respond_to do |format|
         format.html { redirect_to games_path }
         format.json { render json: @games}
       end
    else
      render :new
    end
  end

  def index
    @games = Game.all
    respond_to do |format|
       format.html { redirect_to games_path }
       format.json { render json: @games}
     end
  end

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
       format.html { render :show }
       format.json { render json: @game}
     end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
  			redirect_to game_path(@game)
  	else
  		render :edit
    end
  end

  private
  def game_params
    params.require(:game).permit(:state)
  end
end
