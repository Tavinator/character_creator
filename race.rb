require "./step"
require "./display_item"

class Race < Step
  def initialize()
    @options = [HUMAN, DWARF, ELF]
    @section = "race"
    super
  end

  def enter()
    print "The first major step is selecting a race for your character.\nThe race determines what extra racial abilities you will get.\n"
    continue
    selector_rules
  end

  private

  HUMAN = DisplayItem.new(
  "Human",
  "Humans",
  "Size: Med. Alignment: Any. Speed: 30. Languages: Common and one other.\n Humans have two versions: Normal (+1 to each ability) OR Variant (+1 to any two ablities, +1 skill, +1 feat)",
  "Humans blurb about humans n shit.\n Age: 17 - 95. Size: 5-6 Feet tall, etc",
  'human_subrace_step'
  )
  DWARF = DisplayItem.new(
  "Dwarf",
  "Dwarves",
  "small",
  "angry",
  'dwarf_subrace_step'
  )
  ELF = DisplayItem.new(
  "Elf",
  "Elves",
  "slender",
  "annoying",
  'elf_subrace_step'
  )
end
