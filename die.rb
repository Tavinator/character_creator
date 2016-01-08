class Die
  def initialize(sides)
    @sides = sides
  end

  def roll
    rand(@sides)+1
  end

  D4 = Die.new(4)
  D6 = Die.new(6)
  D8 = Die.new(8)
  D10 = Die.new(10)
  D12 = Die.new(12)
  D20 = Die.new(20)
end


