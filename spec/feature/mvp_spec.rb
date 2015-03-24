require 'capybara/rspec'
require 'ship'
require 'board'

feature 'MVP feature test' do
  let(:board) { Board.new }
  let(:ship) { Ship.new }
  scenario 'ship can be placed on board' do
    board.place_ship ship
    expect(board.grid['A1']).to eq ship
  end

  scenario 'can hit ship' do
    board.place_ship ship
    board.place_shot('A1')
    expect(board.hit_grid['A1']).to eq 'Red'
  end

  scenario 'can sink ship' do
    board.place_ship ship
    board.place_shot('A1')
    board.place_shot('A2')
    expect(board.hit_grid['A1']).to eq 'SunkShip'
    expect(board.hit_grid['A2']).to eq 'SunkShip'
  end
end
