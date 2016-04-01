class RaceSelector

  def first_question
    puts """
    The first step is selecting a race.
    If you know the race you want to select type 'ready'
    Otherwise type in the number to know more about each race
    There are 3 choices:
    1. 'Human' Blah blah humans have these things
    2. 'Dwarf' Blah Dwarves have these other things
    3. 'Elf' Elves have these things
    """
    first_question_logic
  end

  def first_question_logic
    @choice = $stdin.gets.chomp
    if @choice == ("1") || @choice == ("2") || @choice == ("3")
      race_descriptions
    elsif @choice == "ready"
      puts "race_selected"
      race_selection
    else
      puts "try again you niny"
      first_question
    end
  end

  def race_descriptions
    if @choice == "1"
      puts "human shit is this"
    elsif @choice == "2"
      puts "dwarf shit is this"
    elsif @choice == "3"
      puts "elf shit be this too"
    else
      puts "something is wrong"
    end
    first_question
  end

  def race_selection
    puts """
    Select which race you want to play as:
    1. 'Human'
    2. 'Dwarf'
    3. 'Elf'
    """
    @choice = $stdin.gets.chomp
    race_selection_logic
  end

  def race_selection_logic
    if @choice == "1"
      puts "You have selected 'Human' as your race"
    elsif @choice == "2"
      puts "You have selected 'Dwarf' as your race"
    elsif @choice == "3"
      puts "You have selected 'Elf' as your race"
    else
      puts "there are only 3 options please select one of the three"
      race_selection
    end
  end

end
