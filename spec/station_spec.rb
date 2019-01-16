require 'station'

describe Station do

subject(:station) { Station.new('Paddington', 'zone 1')}

it 'shows station name' do
expect(station.name).to eq "Paddington"
end

it 'shows station zone' do
expect(station.zone).to eq "zone 1"
end

end
