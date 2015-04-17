class InvitationsController < ApplicationController
  # need before_action (logged_in?, only...)
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params.require(:invitation).permit(:player_id, :location, :date))
    @invitation.player = current_player

    if @invitation.save
      redirect_to players_path
    else
      render :new
    end
  end

end

