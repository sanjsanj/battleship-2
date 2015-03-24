require 'board'

describe Board do
  let(:ship) { double :ship, ship_length: 2 }

  before(:each) do
    allow(ship).to receive(:hit)
  end

  # it 'can be created (only with size of 2 x 1 for now)' do
  #   expect(subject.grid.size).to eq 2
  # end

  it 'can be created with size 10 x 10' do
    expect(subject.grid.size).to eq 100
  end

  it 'has value \'E\' for every square when created' do
    ('A'..'J').each do |letter|
      (1..10).each do |number|
        expect(subject.grid[(letter + number.to_s).to_s]).to eq 'E'
      end
    end
  end

  it 'can place ship on grid' do
    subject.place_ship(ship)
    expect(subject.grid['A1']).to eq ship
    expect(subject.grid['A2']).to eq ship
  end

  it 'can check if a square is empty' do
    expect(subject.empty?('A1')).to eq true
    subject.place_ship(ship)
    expect(subject.empty?('A1')).to eq false
  end

  it 'can place a shot on an empty square' do
    subject.place_shot('A1')
    expect(subject.hit_grid['A1']).to eq 'White'
  end

  it 'can place a shot on an occupied square' do
    subject.place_ship(ship)
    subject.place_shot('A1')
    expect(subject.hit_grid['A1']).to eq 'Red'
  end

  it 'raises error if shooting at coordinate that has already been shot at' do
    subject.place_shot('A1')
    expect { subject.place_shot('A1') }.to raise_error 'Square already shot at'
    subject.place_ship(ship)
    expect { subject.place_shot('A1') }.to raise_error 'Square already shot at'
  end

  it 'hits ship when placing a hit' do
    subject.place_ship(ship)
    expect(subject.place_shot('A1')).to eq 'Red'
  end

  it 'can sink ship' do
    puts 'Ship we are using: ' + ship.to_s
    subject.place_ship(ship)
    subject.sink_ship(ship)
    expect(subject.hit_grid['A1']).to eq 'SunkShip'
    expect(subject.hit_grid['A2']).to eq 'SunkShip'
  end

  it 'sinks ship when it has been hit enough times' do
    subject.place_ship(ship)
    subject.place_shot('A1')
    allow(ship).to receive(:hit).and_return('SUNK!')
    subject.place_shot('A2')
    expect(subject.hit_grid['A1']).to eq 'SunkShip'
    expect(subject.hit_grid['A2']).to eq 'SunkShip'
  end
end
