require 'board'

describe Board do
  let(:ship) { double :ship, ship_length: 2 }

  it 'can be created (only with size of 2 x 1 for now)' do
    expect(subject.grid.size).to eq 2
  end

  it 'can place ship on grid' do
    subject.place(ship)
    expect(subject.grid['A1']).to eq ship
    expect(subject.grid['A2']).to eq ship
  end

  it 'can check if a square is empty' do
    expect(subject.empty?('A1')).to eq true
    subject.place(ship)
    expect(subject.empty?('A1')).to eq false
  end

  xit 'can place a shot on an empty square'

  it 'can place a shot on an occupied square' do
    subject.hit('A1')
    expect(subject.grid['A1']).to eq 'hit'
  end

  xit 'hits ship when placing a hit'

  it 'knows when ship is sunk' do
    subject.hit('A1')
    subject.hit('A2')
    expect(subject.grid['A1']).to eq 'sunk'
    expect(subject.grid['A2']).to eq 'sunk'
  end
end
