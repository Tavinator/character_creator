
class Scene
    def enter()
    # puts "This scene is not yet configured. Subclass it and implement enter()."
    # exit(1)
  end
end


class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('background_selector')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end

class Introduction < Scene

  def enter()
    puts "Welcome"
    puts "press any key to continue"
    $stdin.gets.chomp
    print "                           \r"
    return 'race_selector'
  end
end

class Race < Scene

  def enter()
    puts "time to select a race"
    return 'human_subrace_selector'
  end
end

class HumanSubraces < Scene

  def enter()
    puts "human subrace selection"
    return 'background_selector'
  end
end

class DwarfSubraces < Scene

  def enter()
  end
end

class ElfSubraces < Scene

  def enter()
  end
end

class Backgrounds < Scene

  def enter()
    puts "done for now."
  end
end


class Map

  @@scenes = {
    'introduction' => Introduction.new(),
    'race_selector' => Race.new(),
    'human_subrace_selector' => HumanSubraces.new(),
    'dwarf_subrace_selector' => DwarfSubraces.new(),
    'elf_subrace_selector' => ElfSubraces.new(),
    'background_selector' => Backgrounds.new(),
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('introduction')
a_game = Engine.new(a_map)
a_game.play()

