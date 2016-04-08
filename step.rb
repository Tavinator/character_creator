
class Step

  def enter()
  end

  def continue()
    puts "...press 'Enter' to continue"
    $stdin.gets.chomp
    system "clear"
  end

  def instructions()
    print """
    If you know the #{@section}  #{@name} you want to select type it in as show on the screen
    Otherwise type in the number to know more about each #{@section}
    There are #{@options.length} choices of #{@section}:
    """
  end

  # def get_input()
  #   @prompt = "\n> "
  #   print @prompt
  #   @choice = $stdin.gets
  # end
end
