class Oystercard

attr_reader :balance, :max_balance, :state, :entry_station
MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_CHARGE = 2
  def initialize
    @balance = 0
    @state = false
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @state
  end

  def touch_in (station)
    fail "Need a minimum of £#{MIN_BALANCE}!" if @balance < MIN_BALANCE
    @state = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    @entry_station = nil
    @state = false
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
