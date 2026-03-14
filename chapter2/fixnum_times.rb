class Integer
  def times
    x = 0
    while x < self
      x += 1
      yield
    end
    self
  end
end
