
class Step

  def enter()
    # puts "This step is not yet configured. Subclass it and implement enter()."
    # exit(1)
  end

  def continue()
    puts "...press 'Enter' to continue"
    $stdin.gets.chomp
    system "clear"
  end

  def instructions()
    print """
    If you know the #{@section}  #{@name} you want to select type it in as show on the screen
    Otherwise type in the number to know more about each #{@section}
    There are #{@options} choices of #{@section}:
    """
  end

  # def selector
  #   #get the number of options from the step
  #     ##{options}
  #   #display those steps
  #   #$stdin.gets.chomp
  # end

  # def descriptor
  #   #use the numbers from the selector
  # end

  # def error_checkor
  # end
end

class DisplayItem
  def initialize(type, plural_type, short_description, long_description)
    @type = type
    @plural_type = plural_type
    @short_description = short_description
    @long_description = long_description
  end

  def display_type
    "#{@type}"
  end

  def display_selection
    "'#{@type}' : #{@short_description}"
  end

  def display_plural_type
    "#{@plural_type}"
  end

  def display_short_description
    "#{@short_description}"
  end

  def display_long_description
    "#{@long_description}"
  end
end


class Engine

  def initialize(step_map)
    @step_map = step_map
  end

  def play()
    current_step = @step_map.opening_step()
    last_step = @step_map.next_step('background_step')

    while current_step != last_step
      next_step_name = current_step.enter()
      current_step = @step_map.next_step(next_step_name)
    end

    current_step.enter()
  end
end


class Introduction < Step

  def enter()
    system "clear"
    print """
    Welcome to Tavi's D&D 5E Character Builder.
    Follow the prompts and soon you will have yourself a character ready for
    ADVENTURE!!!!
    """
    continue
    return 'race_step'
  end
end

class Race < Step

  def enter()
    print """
    The first step is selecting a race for your character.
    The race determines what extra racial abilities you will get
    """
    continue
    race_selector_rules
  end

  def race_selector_rules   #works!
    @human_display_item = DisplayItem.new("Human", "Humans" ,"blah", "blah blah long")
    @dwarf_display_item = DisplayItem.new("Dwarf", "Dwarves" ,"small", "angry")
    @elf_display_item = DisplayItem.new("Elf", "Elves" ,"slender", "annoying")
    races = [@human_display_item.display_selection, @dwarf_display_item.display_selection, @elf_display_item.display_selection]
    h = Hash[races.map.with_index.to_a]
    @section = "race"
    @options = races.length
    instructions
    # print """
    # '#{@human_display_item.display_type}' :#{@human_display_item.display_short_description}
    # '#{@dwarf_display_item.display_type}' :#{@dwarf_display_item.display_short_description}
    # '#{@elf_display_item.display_type}' :#{@elf_display_item.display_short_description}
    # #{races.count}
    # """
    h.each {|key, value| puts " #{value+1} #{key}" }

    @choice = $stdin.gets.chomp
    race_choices
  end

  def race_choices
    system "clear"
    if @choice == ("1") || @choice == ("2") || @choice == ("3")
      race_descriptions
    elsif @choice == ("#{@human_display_item.display_type}") || @choice == ("#{@dwarf_display_item.display_type}") || @choice == ("#{@elf_display_item.display_type}")
      race_selection_logic
    else
      puts "try again you niny"
      race_selector_rules
    end
  end

  def race_descriptions
    if @choice == "1"
      puts "#{@human_display_item.display_plural_type} are #{@human_display_item.display_long_description}"
    elsif @choice == "2"
      puts "#{@dwarf_display_item.display_plural_type} are #{@dwarf_display_item.display_long_description}"
    else @choice == "3"
      puts "#{@elf_display_item.display_plural_type} are #{@elf_display_item.display_long_description}"
    end
    race_selector_rules
  end

  def race_selection_logic
    @section = "race"
    system "clear"
    print """
    Perfect! You have selected #{@choice} as your #{@section}!
    """
    if @choice == ("#{@human_display_item.display_type}")
      return 'human_subrace_step'
    elsif @choice == ("#{@dwarf_display_item.display_type}")
      return 'dwarf_subrace_step'
    else @choice == ("#{@elf_display_item.display_type}")
      return 'elf_subrace_step'
    end
  end
end

class HumanSubraces < Step




  def enter()
    continue
    @options = 2
    @section = "variants"
    instructions
    return 'background_step'
  end
end

class DwarfSubraces < Step

  def enter()
    continue
    @options = 2
    @section = "subrace"
    instructions
    print """
    There are 2 kinds of #{@dwarf_display_item.display_plural_type}
    1. 'Hill' (warmer climate has +1 to this and +1 to this)
    2. 'Mountain' (colder climate has +1 and does this other thing)
    """
    return 'background_step'
  end



end

class ElfSubraces < Step

  def enter()
    continue
    @options = 3
    @section = "subrace"
    instructions
    return 'background_step'
  end
end

class Backgrounds < Step

  def enter()
    puts "done for now."
  end
end


class Map

  @@steps = {
    'introduction' => Introduction.new(),
    'race_step' => Race.new(),
    'human_subrace_step' => HumanSubraces.new(),
    'dwarf_subrace_step' => DwarfSubraces.new(),
    'elf_subrace_step' => ElfSubraces.new(),
    'background_step' => Backgrounds.new(),
  }

  def initialize(start_step)
    @start_step = start_step
  end

  def next_step(step_name)
    val = @@steps[step_name]
    return val
  end

  def opening_step()
    return next_step(@start_step)
  end
end

a_map = Map.new('introduction')
a_game = Engine.new(a_map)
a_game.play()

