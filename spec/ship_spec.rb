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
    # subject.hit
    expect(subject).to be_sunk
  end
end
