class Oystercard

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Reach maximum balance!" if reach_maximum?
    @balance += money
  end

  def reach_maximum?
    @balance >= 90
  end

end
