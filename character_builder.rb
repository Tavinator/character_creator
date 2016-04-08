require "./step"
require "./race"
require "./human_subraces"

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
    print "Welcome to Tavi's D&D 5E Character Builder.\nFollow the prompts and soon you will have yourself a character ready for\nADVENTURE!!!!\n"
    continue
    return 'race_step'
  end
end

# class HumanSubraces < Step
#
#   def enter()
#     continue
#     @options = []
#     @section = "variants"
#     instructions
#     return 'background_step'
#   end
# end

class DwarfSubraces < Step

  def enter()
    continue
    @options = 2
    @section = "subrace"
    instructions

    # There are 2 kinds of #{@dwarf_display_item.plural_type}
    print """
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
