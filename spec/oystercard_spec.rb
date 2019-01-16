require 'oystercard'

describe Oystercard do

  let(:entry_station){ double :station }
  let(:exit_station){ double :station }

  it 'has no balance' do
    expect(subject.balance).to eq 0
  end

  it "reaches the maximum balance" do
    subject.top_up(Oystercard::MAX_BALANCE)
    expect{ subject.top_up(5)}.to raise_error "Reached maximum balance £#{Oystercard::MAX_BALANCE}!"
  end

  it "needs minimum balance" do
    expect{ subject.touch_in(entry_station) }.to raise_error "Need a minimum of £#{Oystercard::MIN_BALANCE}!"
  end

  it "deducts money on touch out" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MIN_CHARGE)
  end

  describe '#in_journey?' do
    it 'initially not in journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#journey" do
    it 'initially has empty journey history ' do
      history = subject.journey
      expect(history.empty?).to eq true
    end

    it "saves journey history" do
      entry_station2 = double(:station)
      exit_station2 = double(:station)
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      subject.touch_in(entry_station2)
      subject.touch_out(exit_station2)
      result = [{in: entry_station, out: exit_station}, {in: entry_station2, out: exit_station2}]
      expect(subject.journey).to eq result
    end

  end

end
