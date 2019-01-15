require 'oystercard'

describe Oystercard do
  let(:station){ double :station }

  describe '#balance' do
    it { is_expected.to respond_to(:balance) }

    it 'has no balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "top up £10" do
      amount = 10
      expect{ subject.top_up amount }.to change{ subject.balance }.by amount
    end

    it "reaches the maximum balance" do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect{ subject.top_up(5)}.to raise_error "Reached maximum balance £#{Oystercard::MAX_BALANCE}!"
    end

    it "needs minimum balance" do
      expect{ subject.touch_in(station) }.to raise_error "Need a minimum of £#{Oystercard::MIN_BALANCE}!"
    end
  end

    it "deducts money on touch out" do
      subject.top_up(5)
      subject.touch_in(station)
      expect{ subject.touch_out }.to change{ subject.balance}.by -(Oystercard::MIN_CHARGE)
    end

  describe "#entry_station" do
    it "saves entry station" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it "forgets entry station when touch out" do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#in_journey?' do
    it 'initially not in journey' do
      #expect(subject.in_journey?).to eq false
      expect(subject).not_to be_in_journey
    end

    it 'can touch in' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

  end
    it 'can touch out' do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

end
