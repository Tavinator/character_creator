# require "./ability_selector"


ability_info = {"Strength" => 18, "Dexterity" => 15, "Constitution" => 20, "Intelligence" => 8, "Wisdom" => 1, "Charisma" => 10}

ability_info.each {|k,v| puts "#{k[0..2].upcase}  #{(((v / 2).floor) -5)}"}


# class AbilityModifierBonus < AbilitySelector
#   def initialize()
#     @ability_bonus = @@ability_scores.clone
#   end
# end

# selector = AbilitySelector.new
# selection = selector.assign_abilities

# puts "test"
# puts @ability_bonus
