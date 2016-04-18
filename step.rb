
class Step

  def initialize(step_def)
    # @my_character = Array.new
    @options = step_def["selections"].map do |raw_selection|
      type = raw_selection["type"]
      plural_type = raw_selection["plural_type"]
      short_description = raw_selection["short_description"]
      long_description = raw_selection["long_description"]
      sub_step = raw_selection["sub_step"]
      DisplayItem.new(type, plural_type, short_description, long_description, sub_step)
    end
    @section = step_def["section"]
  end

  # def initialize()
  #   @my_choices= Array.new
  # end

  def enter()
    print "The first major step is selecting a race for your character.\nThe race determines what extra racial abilities you will get.\n"
    continue
    selector_rules
  end

  def welcome()
    print "The next step is selecting a #{@section} for your character.\n"
  end

  def continue()
    puts "\n...press 'Enter' to continue"
    $stdin.gets.chomp
    system "clear"
  end

  def instructions()
    print "If you know the #{@section} you want to select type it in as show on the screen\nOtherwise type in the number to know more about each #{@section}\nThere are #{@options.length} choices of #{@section}:\n"
  end

  def selector_rules
    instructions
    @options.each_with_index {|option, index| print "\n #{index+1} #{option.short_selection}" } #takes the option array and makes a hash with the index of the array, then inside we are messing with the print
    prompt = "\n\n> "
    print prompt
    @choice = $stdin.gets.chomp
    # get_input
    choices
  end

  def choices
    if @options.map(&:type).include?(@choice)
      descriptions
    elsif @choice.strip =~ /\A\d+\z/ && @options[@choice.to_i-1]
      selection_logic
    else
      puts "\ntry again you ninny"
      continue
      selector_rules
    end
  end

  def descriptions
    full_description_hash = DisplayItem.full_description(@options)
    show_description = full_description_hash[@choice] if full_description_hash.include?(@choice)
    puts "\n #{show_description}"
    continue
    selector_rules
  end

  def selection_logic

    system "clear"
    my_selection = @options[@choice.to_i-1].type
    # to_save = @option[@choice].type
    print "Perfect! You have selected #{my_selection} as your #{@section}!\n"
    next_selection_hash = DisplayItem.select_next(@options)
    @my_choices.push(my_selection)
    @my_choices.each do | thing |
      puts thing
    end
    return next_selection_hash[my_selection] if next_selection_hash.include?(my_selection)
  end
end
