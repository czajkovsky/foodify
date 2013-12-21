module ApplicationHelper

  def current_worker?
    current_user.worker?
  end

  def current_client?
    !current_user.worker?
  end

  def current_cook?
    current_user.cook?
  end

  def current_waiter?
    current_user.waiter?
  end

end
