require 'board'

describe Board do
  it 'can be created with a default size of 2 x 1' do
    expect(subject.grid.size).to eq 2
  end
end
