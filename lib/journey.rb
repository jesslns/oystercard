class Journey

attr_reader :entry_station, :exit_station

  def initialize(args = { in: nil, out: nil})
    @entry_station = args[:in] || ''
    @exit_station = args[:out] || ''
  end
end
