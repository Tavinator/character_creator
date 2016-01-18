require "./ability_selector"
class AbilityModifierBonus < AbilitySelector
  def initialize()
    selector = AbilitySelector.new
    selection = selector.assign_abilities
    @scores = selector.the_scores
  end

  def writeit

    modifiers@scores.each {|k,v| puts "#{k[0..2].upcase}  #{(((v / 2).floor) -5)}"}
  end
end


# ability_info.each {|k,v| puts "#{k[0..2].upcase}  #{(((v / 2).floor) -5)}"}


modifier_creator = AbilityModifierBonus.new
modifier_calculator = modifier_creator.writeit
puts modifier_calculator

