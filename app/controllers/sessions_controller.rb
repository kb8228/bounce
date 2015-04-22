class SessionsController < ApplicationController

  def new
  end

  def create
    player = Player.find_by(email: params[:login][:email])

    if player && player.authenticate(params[:login][:password])
      session[:player_id] = player.id.to_s #cookies can only accept strings
      redirect_to players_path
    else
      flash.now[:error] = "Your email or password are incorrect."
      render :new
    end
  end

  def destroy
    session.delete(:player_id)
    redirect_to login_path
  end

end
