require 'ship'

describe Ship do
  it 'can be initiated with a length' do
    expect(subject.length).not_to eq 0
  end

  it 'can be hit' do
    subject.hit
    expect(subject.hit_count).to eq 1
  end

  it 'can be sunk' do
    subject.hit
    expect(subject.hit).to eq 'SUNK!'
    expect(subject).to be_sunk
  end

  it 'can have a size of 2, 3, 4 or 5 when created' do
    ship2 = Ship.new 2
    ship3 = Ship.new 3
    ship4 = Ship.new 4
    ship5 = Ship.new 5
    expect(ship2.length).to eq 2
    expect(ship3.length).to eq 3
    expect(ship4.length).to eq 4
    expect(ship5.length).to eq 5
  end

  it 'cannot be instantiated with a length of less than 2 or more than 5' do
    expect { (Ship.new 1) }.to raise_error 'Invalid length'
    expect { (Ship.new 6) }.to raise_error 'Invalid length'
  end
end
