require "./race"


class DwarfSubraces < Step
  def initialize()
    @options = [HILL, MOUNTAIN]
    @section = "subrace"
    super
  end

  def enter()
    # print "The next step is selecting a subrace option for your character.\n"
    welcome
    continue
    selector_rules
  end

  private

  HILL = DisplayItem.new(
  "Hill",
  "Hill Dwarves",
  "WIS +1 & Dwarven Toughness: +1HP each level",
  "By selecting 'Hill', you will gain +1 to your Wisdom score\n AND gain the Feat: Dwarven Toughness, which increases your\n hit points by 1 every level, starting at level 1. ",
  'background_step'
  )
  MOUNTAIN = DisplayItem.new(
  "Mountain",
  "Mountain Dwarves",
  "STR +1 & Dwarven Armor Training",
  "By selecting 'Mountain', you will gain +1 to your Strength score\n AND gain the Proficiency: Dwarven Armor Training, meaning\n you are now proficient with light and medium armor.",
  'background_step'
  )
end
