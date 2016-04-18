
require "./display_item"

class Character
  attr_accessor :race, :subrace, :background, :ids

  # def initialize()
  #   @my_choices= Array.new
  #   @my_character = {"Race" => nil, "Subrace" => nil, "Background" => nil}
  # end

  def initialize
    self.ids = [ ]
  end

p = Character.new
# p.race = "unknown"
# p.subrace = "unknown"
# p.background = "unknown"



end
