class UserDecorator < Draper::Decorator
  delegate_all

  def type_class
    classes = { 'Client' => 'default', 'Cook' => 'info', 'Waiter' => 'primary' }
    "label label-#{classes[object.type.to_s]}"
  end

end
