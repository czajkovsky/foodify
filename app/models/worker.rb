class Worker < User

  def client?
    false
  end

  def worker?
    true
  end

end
