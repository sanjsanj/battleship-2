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

  it 'can place a hit' do
    subject.hit('A1')
    expect(subject.grid['A1']).to eq 'hit'
  end
end
