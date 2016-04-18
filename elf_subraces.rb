require "./race"


class ElfSubraces < Step
  def initialize()
    @options = [HIGH, WOOD]
    @section = "subraces"
    super
  end

  def enter()
    # print "The next step is selecting a variant option for your character.\n"
    welcome
    continue
    selector_rules
  end

  private

  HIGH = DisplayItem.new(
  "High",
  "High Elves",
  "INT +1 & 1 Wizard Cantrip & 1 Extra Language",
  "By selecting 'High', you will gain +1 to your Intelligence score\n AND gain a Spell Cantrip: Any one cantrip from the wizard spell list.\n AND gain an additional language that you can read, write, and speak.",
  'background_step'
  )
  WOOD = DisplayItem.new(
  "Wood",
  "Wood Elves",
  "WIS +1 & Feats: Fleet of Foot & Mask of the Wild",
  "By selecting 'Wood', you will gain +1 to your Wisdom score\n AND gain the Feat: Fleet of Foot, which increases you move speed to 35\n AND gain the Feat: Mask of the Wild, where you can attempt to hide when\n lightly obscured by foliage, heavy rain, falling snow, mist,\n or other natural phenomenon.",
  'background_step'
  )
end
