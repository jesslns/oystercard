class Oystercard

attr_reader :balance, :max_balance, :entry_station, :journey, :exit_station
MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_CHARGE = 2
  def initialize
    @balance = 0
    @entry_station = nil
    @journey = []
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in (entry_station)
    fail "Need a minimum of £#{MIN_BALANCE}!" if @balance < MIN_BALANCE
    @entry_station = entry_station
    hash = make_hash
    hash[:in] = entry_station
    @journey << hash
  end

  def touch_out(exit_station)
    deduct(MIN_CHARGE)
    @entry_station = nil
    @exit_station = exit_station
    @journey[-1][:out] = exit_station
  end

def make_hash
  {in: nil, out: nil}
end

  private
  def deduct(amount)
    @balance -= amount
  end

end
