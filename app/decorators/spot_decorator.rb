class SpotDecorator < Draper::Decorator
  delegate_all

  def state_class
    classes = { 'free' => 'success', 'used' => 'info', 'finished' => 'danger' }
    "label label-#{classes[object.state.to_s]}"
  end

end
