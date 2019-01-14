class Oystercard

attr_reader :balance, :max_balance

MAX_BALANCE = 90
  def initialize
    @balance = 0
    @balance
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
