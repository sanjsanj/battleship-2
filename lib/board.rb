# board
class Board
  attr_reader :grid, :hit_grid

  def initialize # grid_size = 2
    @grid = { 'A1' => 'E', 'A2' => 'E' }
    @hit_grid = { 'A1' => 'E', 'A2' => 'E' }
    # Have not accounted for any grid size other than 2
  end

  def place_ship(ship)
    @grid = { 'A1' => ship, 'A2' => ship }
  end

  def empty?(coord)
    @grid[coord] == 'E'
  end

  def place_shot(coord) # rubocop: disable all
    fail 'Square already shot at' if @hit_grid[coord] != 'E'
    if @grid[coord] == 'E'
      @hit_grid[coord] = 'White'
    elsif @grid[coord].hit == 'SUNK!'
      @grid[coord].hit
      @hit_grid[coord] = 'SunkShip'
    else
      @hit_grid[coord] = 'Red'
    end
  end
end
