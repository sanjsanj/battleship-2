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

  xit 'can place a shot on an occupied square'

  xit 'hits ship when placing a hit'

  xit 'knows when ship is sunk'
end
