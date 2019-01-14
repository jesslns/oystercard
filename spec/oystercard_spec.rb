require 'oystercard'

describe Oystercard do
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
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "deducts money from oystercard" do
      subject.top_up(10)
      amount = 2
      expect{ subject.deduct amount }.to change{ subject.balance }.by -amount
    end
  end

end
