class Client < User
  has_one :spot

  def has_spot?
    self.status != 'out'
  end

  def client?
    true
  end

  def worker?
    false
  end

  def waiter?
    false
  end

  def cook?
    false
  end

  def label_class
    'warning'
  end

  def state_class
    classes = { 'out' => 'default', 'at_table' => 'success', 'finished' => 'warning' }
    classes[self.status.to_s]
  end

end
