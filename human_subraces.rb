require "./race"


class HumanSubraces < Step

  def enter()
    print "The next step is selecting a variant option for your character.\n"
    continue
    selector_rules
    #the first thing
  end

  private

  NORMAL = DisplayItem.new("Normal", "Normal Humans", "+1 to each ability", "By selecting 'Normal', each of your 6 ability scores will be increased by 1.")
  VARIANT = DisplayItem.new("Variant", "Variant Humans", "+1 to only 2 ablities, +1 skill, +1 feat", "By selecting 'Variant', only 2 of your 6 ability scores will be increased by 1. Also you will later on be able to select an additional skill and a feat." )
  # SELECTNEXT = {NORMAL.type => 'background_step', VARIANT.type =>}

  def selector_rules
    @options = [NORMAL, VARIANT]
    @section = "variants"
    instructions
    @options.each_with_index {|option, index| print "\n #{index+1} #{option.short_selection}" }
    prompt = "\n\n> "
    print prompt
    @choice = $stdin.gets.chomp
    # get_input
    choices
  end

  def choices
    if @choice.strip =~ /\A\d+\z/ && @options[@choice.to_i-1]
      descriptions
    elsif @options.map(&:type).include?(@choice)
      selection_logic
    else
      puts "\ntry again you ninny"
      continue
      selector_rules
    end
  end

  def descriptions
    long_blurb = @options[@choice.to_i-1].long_description
    puts "\n #{long_blurb}"
    continue
    selector_rules
  end

  def selection_logic
    system "clear"
    print "Perfect! You have selected #{@choice} as your #{@section}!\n"
    return 'background_step'
  end
end
