# board
class Board
  attr_reader :grid, :hit_grid

  # def initialize # grid_size = 2
  #   @grid = { 'A1' => 'E', 'A2' => 'E' }
  #   @hit_grid = { 'A1' => 'E', 'A2' => 'E' }
  #   # Have not accounted for any grid size other than 2
  # end

  def initialize
    @grid = {}
    ('A'..'J').each do |letter|
      (1..10).each do |number|
        @grid[(letter + number.to_s).to_s] = 'E'
      end
    end
    init_hit_grid
  end

  def init_hit_grid
    @hit_grid = {}
    ('A'..'J').each do |letter|
      (1..10).each do |number|
        @hit_grid[(letter + number.to_s).to_s] = 'E'
      end
    end
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
      sink_ship(@grid[coord])
    else
      @hit_grid[coord] = 'Red'
    end
  end

  def sink_ship(ship)
    @grid.each_pair do |coord, square_contents|
      @hit_grid[coord] = 'SunkShip' if square_contents == ship
    end
  end
end
