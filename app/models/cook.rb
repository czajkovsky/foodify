class Cook < Worker

  def cook?
    true
  end

  def waiter?
    false
  end

  def label_class
    'info'
  end

end
