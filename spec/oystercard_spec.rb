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
      money = 10
      expect{ subject.top_up money }.to change{ subject.balance }.by money
    end

    it "reaches the maximum balance" do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect{ subject.top_up(5)}.to raise_error "Reached maximum balance £#{Oystercard::MAX_BALANCE}!"
    end
  end

end
