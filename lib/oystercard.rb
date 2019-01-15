class Oystercard

attr_reader :balance, :max_balance, :state

MAX_BALANCE = 90
  def initialize
    @balance = 0
    @state = false
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @state
  end

  def touch_in
    @state = true
  end

  def touch_out
    @state = false
  end
end
