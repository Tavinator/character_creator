class Character
  def initialize(race, classtype, background, abilities)
    @race = race
    @classtype = classtype
    @background = background
    @abilities = abilities
  end

  def start
    @race = nil
    @classtype = nil
    @background = nil
    @abilities = nil
  end
end
