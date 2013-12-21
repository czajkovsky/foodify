class Client < User
  has_one :spot

  def has_spot?
    self.status != 'out'
  end
end
