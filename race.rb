require "./step"
require "./display_item"

class Race < Step
  def initialize()
    @options = [HUMAN, DWARF, ELF]
    @section = "race"
  end

  def enter()
    print "The first step is selecting a race for your character.\nThe race determines what extra racial abilities you will get.\n"
    continue
    selector_rules
  end

  private

  HUMAN = DisplayItem.new("Human", "Humans" ,"blah", "blah blah long", 'human_subrace_step')
  DWARF = DisplayItem.new("Dwarf", "Dwarves" ,"small", "angry", 'dwarf_subrace_step')
  ELF = DisplayItem.new("Elf", "Elves" ,"slender", "annoying", 'elf_subrace_step')

end
