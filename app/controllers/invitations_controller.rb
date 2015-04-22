class InvitationsController < ApplicationController
  # need before_action (logged_in?, only...)

  # def index
  #   @invitations = Invitation.all
  # end

  def new
    @invitation = Invitation.new
  end

  def create
    @player = current_player
    @invitation = @player.invitations.new(params.require(:invitation).permit(:player_id, :location, :date))

    if @invitation.save
      redirect_to players_path
    else
      render :new
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.responder_id = current_player.id

    if @invitation.save
      redirect_to player_path
    else
      render :show
    end
  end

end

