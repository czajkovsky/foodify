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

end
