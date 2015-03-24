# ship
class Ship
  attr_reader :length
  attr_reader :hit_count

  def initialize(length = 2)
    fail 'Invalid length' if length < 2 || length > 5
    @length = length
    @hit_count = 0
  end

  def hit
    @hit_count += 1
    'SUNK!' if sunk?
  end

  def sunk?
    @hit_count >= @length
  end
end
