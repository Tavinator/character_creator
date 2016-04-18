#!/usr/bin/ruby
require "pry"
require "rubygems"
require "json"

require "./step"
require "./introduction"
require "./race"
require "./human_subraces"
require "./dwarf_subraces"
require "./elf_subraces"
require "./backgrounds"
require "./classes"

class Engine

  def initialize(step_map)
    @step_map = step_map
  end

  def play()
    current_step = @step_map.opening_step()
    last_step = @step_map.next_step('class_step')

    while current_step != last_step
      next_step_name = current_step.enter()
      current_step = @step_map.next_step(next_step_name)
    end

    current_step.enter()
  end
end

class Map

  # @@steps = {
  #   'introduction' => Introduction.new(),
  #   'race_step' => Race.new(),
  #   'human_subrace_step' => HumanSubraces.new(),
  #   'dwarf_subrace_step' => DwarfSubraces.new(),
  #   'elf_subrace_step' => ElfSubraces.new(),
  #   'background_step' => Backgrounds.new(),
  #   'class_step' => Classes.new(),
  # }

  file = File.open('config/steps.json')
  raw_steps = JSON.parse(file.read)


  @@steps = {
    'introduction' => Introduction.new(),
    'race_step' => Step.new(raw_steps[0]),
    'human_subrace_step' => Step.new(raw_steps[1]),
    'dwarf_subrace_step' => Step.new(raw_steps[2]),
    'elf_subrace_step' => Step.new(raw_steps[3]),
    'background_step' => Step.new(raw_steps[4]),
    'class_step' => Classes.new(),
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
