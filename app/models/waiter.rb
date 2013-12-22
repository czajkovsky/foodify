class Waiter < Worker
  has_many :spots

  def cook?
    false
  end

  def waiter?
    true
  end

  def label_class
    'primary'
  end

end
