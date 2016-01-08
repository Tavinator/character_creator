class Die
  def initialize(sides)
    @sides = sides
  end

  def roll
    rand(@sides)+1
  end
end

FOUR_SIDED_DIE = Die.new(4)
SIX_SIDED_DIE = Die.new(6)
EIGHT_SIDED_DIE = Die.new(8)
TEN_SIDED_DIE = Die.new(10)
TWELVE_SIDED_DIE = Die.new(12)
TWENTY_SIDED_DIE = Die.new(20)
