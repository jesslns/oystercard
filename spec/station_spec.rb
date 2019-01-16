require 'station'

describe Station do

  subject(:station) { Station.new('Paddington', '1') }

  context 'a station should describe itself' do

    it 'can report its name' do
      expect(station.name).to eq('Paddington')
    end

    it 'can report its zone' do
      expect(station.zone).to eq('1')
    end

  end

end




