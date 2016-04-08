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
  SELECTNEXT = {HUMAN.type => 'human_subrace_step', DWARF.type => 'dwarf_subrace_step', ELF.type => 'elf_subrace_step'}

  def selector_rules   #works!
    @options = [HUMAN, DWARF, ELF]
    @section = "race"
    instructions
    @options.each_with_index {|option, index| print "\n #{index+1} #{option.short_selection}" }
    prompt = "\n\n> "
    print prompt
    @choice = $stdin.gets.chomp
    # get_input
    choices
  end

  def choices
    if @choice.strip =~ /\A\d+\z/ && @options[@choice.to_i-1]
      descriptions
    elsif @options.map(&:type).include?(@choice)
      selection_logic
    else
      puts "\ntry again you niny"
      continue
      selector_rules
    end
  end

  def descriptions
    long_blurb = @options[@choice.to_i-1].long_description
    puts "\n #{long_blurb}"
    continue
    selector_rules
  end

  def selection_logic
    @section = "race"
    system "clear"
    print "Perfect! You have selected #{@choice} as your #{@section}!\n"
    return SELECTNEXT[@choice] if SELECTNEXT.include?(@choice)
  end
end
