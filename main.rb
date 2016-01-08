require "./character_ability_roller"

roller = CharacterAbilityRoller.new
scores = roller.generate_character_scores
total = scores.inject(:+)

puts scores.inspect + " = a total of " + total.to_s
