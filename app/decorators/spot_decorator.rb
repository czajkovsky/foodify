class SpotDecorator < Draper::Decorator
  delegate_all

  def state_class
    classes = { 'free' => 'success', 'pending' => 'info', 'finished' => 'danger' }
    "label label-#{classes[object.state.to_s]}"
  end

  def current_client
    object.client.try(:email) || 'No client at this spot'
  end

  def current_waiter
    object.waiter.try(:email) || 'No waiter at this spot'
  end

  def has_client?
    object.client.present?
  end

  def has_waiter?
    object.waiter.present?
  end

end
