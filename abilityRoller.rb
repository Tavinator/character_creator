
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

class CharacterAbilityRoller
  def initialize()
    @dice = (1..4).map { SIX_SIDED_DIE }
  end

  def generate_character_scores
    begin
      scores = (1..6).map { ability_score }
      total = scores.inject(:+)
    end while total >= 78
    scores
  end

  private

  def ability_score
    score = []
    for die in @dice
      roll = die.roll
      if roll == 1
        redo
      end
      score.push roll
    end
    score.sort.drop(1).inject(:+)
  end
end

roller = CharacterAbilityRoller.new
scores = roller.generate_character_scores

puts scores.inspect

