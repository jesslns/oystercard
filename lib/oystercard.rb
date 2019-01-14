class Oystercard

attr_reader :balance, :max_balance

MAX_BALANCE = 90
  def initialize
    @balance = 0
    @balance
  end

  def top_up(money)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + money > MAX_BALANCE
    @balance += money
  end

end
