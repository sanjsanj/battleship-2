# ship
class Ship
  attr_reader :length
  attr_reader :hit_count

  def initialize(length = 2)
    @length = length
    @hit_count = 0
  end

  def hit
    @hit_count += 1
  end
end
