require "./step"
require "./display_item"

class Race < Step

  def enter()
    print "The first step is selecting a race for your character.\nThe race determines what extra racial abilities you will get.\n"
    continue
    selector_rules
  end

  private

  HUMAN = DisplayItem.new("Human", "Humans" ,"blah", "blah blah long")
  DWARF = DisplayItem.new("Dwarf", "Dwarves" ,"small", "angry")
  ELF = DisplayItem.new("Elf", "Elves" ,"slender", "annoying")
  FULLDESCRIPTION = {HUMAN.type => HUMAN.long_description, DWARF.type => DWARF.long_description, ELF.type => ELF.long_description}
  SELECTNEXT = {HUMAN.type => 'human_subrace_step', DWARF.type => 'dwarf_subrace_step', ELF.type => 'elf_subrace_step'}

  def selector_rules   #works!
    @options = [HUMAN, DWARF, ELF]
    @section = "race"
    instructions
    @options.each_with_index {|option, index| print "\n #{index+1} #{option.short_selection}" } #takes the option array and makes a hash with the index of the array, then inside we are messing with the print
    prompt = "\n\n> "
    print prompt
    @choice = $stdin.gets.chomp
    # get_input
    choices
  end

  def choices
    if @options.map(&:type).include?(@choice)
      descriptions
    elsif @choice.strip =~ /\A\d+\z/ && @options[@choice.to_i-1]
      selection_logic
    else
      puts "\ntry again you ninny"
      continue
      selector_rules
    end
  end

  def descriptions
    show_description = FULLDESCRIPTION[@choice] if FULLDESCRIPTION.include?(@choice)
    puts "\n #{show_description}"
    continue
    selector_rules
  end

  def selection_logic
    system "clear"
    my_selection = @options[@choice.to_i-1].type
    print "Perfect! You have selected #{my_selection} as your #{@section}!\n"
    return SELECTNEXT[my_selection] if SELECTNEXT.include?(my_selection)
  end
end
