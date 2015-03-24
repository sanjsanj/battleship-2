require 'ship'

describe Ship do
  it 'can be initiated with a length' do
    expect(subject.length).not_to eq 0
  end
end
