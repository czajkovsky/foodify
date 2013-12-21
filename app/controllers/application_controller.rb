class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  def is_worker?
    if !current_user.present? or !current_user.worker?
      redirect_to no_privileges_path
    end
  end

end
