class Waiter < Worker
  has_many :spots

  def cook?
    false
  end

  def waiter?
    true
  end

end
