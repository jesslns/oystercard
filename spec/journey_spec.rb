require 'journey'

describe Journey do

  subject(:journey) { Journey.new({in: 'Paddington', out: 'Aldgate'}) }
  before(:each) do

  end
  it 'records entry station' do
    expect(journey.entry_station).to eq "Paddington"
  end

  it 'records exit station' do
    expect(journey.exit_station).to eq "Aldgate"
  end

end
