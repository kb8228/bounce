class PlayersController < ApplicationController

  before_action :require_login, except: [:new, :create, :index]
  before_action :authorized?, only: [:edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      session[:player_id] = @player.id.to_s #logs in player automatically upon signup
      flash[:welcome] = "Welcome, #{@player.username}!"
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      flash[:message] = "Your info was updated!"
      redirect_to player_path(@player)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    session.delete(:player_id)
    redirect_to players_path
  end

  private
  def player_params
    params.require(:player).permit(:username, :email, :password, :password_confirmation, :current_password, :years_played, :image, :gender)
  end

  def require_login
    unless logged_in?
      flash[:error] = "Please log in or sign up to access this page."
      redirect_to login_path
    end
  end

  def authorized?
    unless current_player == Player.find(params[:id])
      flash[:error] = "You are not authorized to access that page."
      redirect_to players_path
    end
  end

end #end controller
