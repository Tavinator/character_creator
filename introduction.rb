require "./step"

class Introduction < Step

  def intitialize()

  end

  def enter()
    system "clear"
    print "Welcome to Tavi's D&D 5E Character Builder.\nFollow the prompts and soon you will have yourself a character ready for\nADVENTURE!!!!\n"
    continue
    return 'race_step'
  end
end
