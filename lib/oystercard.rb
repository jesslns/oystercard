require_relative 'journey'

class Oystercard

attr_reader :balance, :max_balance, :journey_list
MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_CHARGE = 2
  def initialize
    @balance = 0
    @journey_list = []
  end

  def top_up(amount)
    fail "Reached maximum balance £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE # >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    return false if @journey_list.empty?
    @journey_list[-1][:out].nil?
  end

  def touch_in (entry_station)
    fail "Need a minimum of £#{MIN_BALANCE}!" if @balance < MIN_BALANCE
    hash = {}
    hash[:in] = entry_station
    @journey_list << Journey.new(hash)
  end

  def touch_out(exit_station)
    deduct(MIN_CHARGE)
    @journey_list[-1][:out] = exit_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
