class Oystercard

attr_reader :balance, :max_balance, :entry_station
MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_CHARGE = 2
  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in (station)
    fail "Need a minimum of £#{MIN_BALANCE}!" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
