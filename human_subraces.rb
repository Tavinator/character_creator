require "./race"


class HumanSubraces < Step
  def initialize()
    @options = [NORMAL, VARIANT]
    @section = "variants"
  end

  def enter()
    # print "The next step is selecting a variant option for your character.\n"
    welcome
    continue
    selector_rules
  end

  private

  NORMAL = DisplayItem.new(
  "Normal",
  "Normal Humans",
  "+1 to each ability",
  "By selecting 'Normal', each of your 6 ability scores will be increased by 1.",
  'background_step'
  )
  VARIANT = DisplayItem.new(
  "Variant",
  "Variant Humans",
  "+1 to only 2 ablities, +1 skill, +1 feat",
  "By selecting 'Variant', only 2 of your 6 ability scores will be increased by 1.\n Also you will later on be able to select an additional skill and a feat.",
  'background_step'
  )
end
