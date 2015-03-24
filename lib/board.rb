# board
class Board
  attr_reader :grid

  def initialize # grid_size = 2
    @grid = { 'A1' => 'E', 'A2' => 'E' }
    # Have not accounted for any grid size other than 2
  end

  def place(ship)
    @grid = { 'A1' => ship, 'A2' => ship }
  end
end
