require "./die"
class CharacterAbilityRoller
  def initialize()
    @dice = (1..4).map { Die::D6 }
  end

  def generate_character_scores
    begin
      scores = (1..6).map { ability_score }
      total = scores.inject(:+)
    end while total <= 78
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

