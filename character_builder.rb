
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
    If you know the #{@section} you want to select type it in as show on the screen
    Otherwise type in the number to know more about each #{@section}
    There are #{@options} choices of #{@section}:
    """
  end

  def selector
    #get the number of options from the step
      ##{options}
    #display those steps
    #$stdin.gets.chomp
  end

  def descriptor
    #use the numbers from the selector
  end

  def error_checkor
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

  def race_selector_rules
    @options = 3
    @section = "race"
    instructions
    print """
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
      puts "humans are cool they do stuff, this is a blurb about them."
    elsif @choice == "2"
      puts "dwarves be cooler, cuz they are smaller n shit."
    else @choice == "3"
      puts "elves think they are all that. They be nimble n shit."
    end
    race_selector_rules
  end

  def race_selection_logic
    @section = "race"
    system "clear"
    print """
    Perfect! You have selected #{@choice} as your #{@section}!
    """
    if @choice == ("Human")
      return 'human_subrace_step'
    elsif @choice == ("Dwarf")
      return 'dwarf_subrace_step'
    else @choice == ("Elf")
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
    There are 2 kinds of Dwarves
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

