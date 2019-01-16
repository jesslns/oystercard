class Oystercard

attr_reader :balance, :max_balance, :journey
MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_CHARGE = 2
  def initialize
    @balance = 0
    @journey = []
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    return false if @journey.empty?
    @journey[-1][:out].nil?
  end

  def touch_in (entry_station)
    fail "Need a minimum of £#{MIN_BALANCE}!" if @balance < MIN_BALANCE
    hash = make_hash
    hash[:in] = entry_station
    @journey << hash
  end

  def touch_out(exit_station)
    deduct(MIN_CHARGE)
    @journey[-1][:out] = exit_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def make_hash
    {in: nil, out: nil}
  end

end
