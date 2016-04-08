
class Step

  def enter()
  end

  def continue()
    puts "\n...press 'Enter' to continue"
    $stdin.gets.chomp
    system "clear"
  end

  def instructions()
    print "If you know the #{@section} you want to select type it in as show on the screen\nOtherwise type in the number to know more about each #{@section}\nThere are #{@options.length} choices of #{@section}:\n"
  end

  # def get_input()
  #   @prompt = "\n> "
  #   print @prompt
  #   @choice = $stdin.gets
  # end
end
