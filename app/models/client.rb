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

end
