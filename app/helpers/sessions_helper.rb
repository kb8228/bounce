module SessionsHelper

  def logged_in?
    session[:player_id] != nil
  end

end
