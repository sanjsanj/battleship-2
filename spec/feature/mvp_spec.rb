require 'capybara/rspec'

feature 'MVP feature test' do
  scenario 'ship can be placed on board' do
    board.place ship
    expect(board.cell 'A1').to eq ship
  end
end
