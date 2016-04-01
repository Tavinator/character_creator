
class Step
    def enter()
    # puts "This step is not yet configured. Subclass it and implement enter()."
    # exit(1)
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
    puts "...press any key to continue"
    $stdin.gets.chomp
    system "clear"
    return 'race_step'
  end
end

class Race < Step

  def enter()
    print """
    The first step is selecting a race for your character.
    The race determines what extra racial abilities you will get
    """
    puts "...press any key to continue"
    $stdin.gets.chomp
    system "clear"
    race_selector_rules
  end

  def race_selector_rules
    print """
    If you know the race you want to select type it in as show on the screen
    Otherwise type in the number to know more about each race
    There are 3 choices of races:
    1. 'Human' (Blah blah humans have these things)
    2. 'Dwarf' (Blah Dwarves have these other things)
    3. 'Elf' (Elves have these things)
    """
    @choice = $stdin.gets.chomp
    race_choices
  end

  def race_choices
    system "clear"
    if @choice == ("1") || @choice == ("2") || @choice == ("3")
      race_descriptions
    elsif @choice == ("Human") || @choice == ("Dwarf") || @choice == ("Elf")
      race_selection_logic
    else
      puts "try again you niny"
      race_selector_rules
    end
  end

  def race_descriptions
    if @choice == "1"
      puts "human shit is this"
    elsif @choice == "2"
      puts "dwarf shit is this"
    else @choice == "3"
      puts "elf shit be this too"
    end
    race_selector_rules
  end

  def race_selection_logic
    system "clear"
    print """
    Perfect! You know what you would like to play as!
    """
    if @choice == ("Human")
      puts "And you have selected 'Human' as your race"
      return 'human_subrace_step'
    elsif @choice == ("Dwarf")
      puts "And you have selected 'Dwarf' as your race"
      return 'dwarf_subrace_step'
    elsif @choice == ("Elf")
      puts "And you have selected 'Elf' as your race"
      return 'elf_subrace_step'
    else
      puts "there are only 3 options please select one of the three"
      race_selection
    end
  end
end

class HumanSubraces < Step

  def enter()
    puts "human subrace selection"
    return 'background_step'
  end
end

class DwarfSubraces < Step

  def enter()
    puts "DWARF subrace selection"
    return 'background_step'
  end
end

class ElfSubraces < Step

  def enter()
    puts "ELF subrace selection"
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

