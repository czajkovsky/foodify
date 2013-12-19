class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_worker?
    redirect_to new_user_session_path unless current_user.worker?
  end

end
