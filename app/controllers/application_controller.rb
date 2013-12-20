class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_worker?
    if !current_user.present? or !current_user.worker?
      redirect_to 'https://netguru.co'
    end
  end

end
