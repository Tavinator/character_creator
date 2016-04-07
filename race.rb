require "./step"
require "./display_item"

class Race < Step

  def enter()
    print """
    The first step is selecting a race for your character.
    The race determines what extra racial abilities you will get
    """
    continue
    selector_rules
  end

  private

  HUMAN = DisplayItem.new("Human", "Humans" ,"blah", "blah blah long")
  DWARF = DisplayItem.new("Dwarf", "Dwarves" ,"small", "angry")
  ELF = DisplayItem.new("Elf", "Elves" ,"slender", "annoying")

  def selector_rules   #works!

    @options = [HUMAN, DWARF, ELF]
    @section = "race"
    instructions
    @options.each_with_index {|option, index| print "\n #{index+1} #{option.short_selection}" }
    prompt = "\n> "
    print prompt
    @choice = $stdin.gets.chomp
    choices
  end

  def choices
    system "clear"
    if @choice.strip =~ /\A\d+\z/ && @options[@choice.to_i-1]
      descriptions
    elsif @options.map(&:type).include?(@choice)
      selection_logic
    else
      puts "try again you niny"
      selector_rules
    end
  end

  def descriptions
    long_blurb = @options[@choice.to_i-1].long_description
    puts long_blurb
    selector_rules
  end

  def selection_logic
    @section = "race"
    system "clear"
    print """
    Perfect! You have selected #{@choice} as your #{@section}!
    """

    # 1) create a class level hash constant where the keys are types and the values are steps
    # 2) look up the choice in hash and return the value
    if @choice == ("#{HUMAN.type}")
      return 'human_subrace_step'
    elsif @choice == ("#{DWARF.type}")
      return 'dwarf_subrace_step'
    else @choice == ("#{ELF.type}")
      return 'elf_subrace_step'
    end
  end
end
