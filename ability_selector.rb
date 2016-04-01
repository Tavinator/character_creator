require './character_ability_roller'
class AbilitySelector

  def initialize()
    @ability_names = ["Strength", "Dexerity", "Constitution", "Intelligence", "Wisdom", "Charisma"]
    @ability_scores = {}
    roller = CharacterAbilityRoller.new
    scores = roller.generate_character_scores
    @total = scores.inject(:+)
    @score_totals = scores.sort.reverse
  end

  def set_ability_process
    line_dashes
    start_description
    score_checker
    assign_abilities
    calculate_bonuses
  end

  private

  def score_checker
    puts "The total sum of your rolls was: " + @total.to_s + " so we kept it!"
    while @ability_scores.count < 5
      print "The scores that you need to set are: #{@score_totals.inspect}\n"
      print "Of the following abilities: #{@ability_names.inspect}\n"
      print "What score do you want #{@ability_names.first} to be set to?  "
      user_input
      line_dashes
      validate_user_input
      @score_totals = @score_totals.sort.reverse
    end
  end

  def assign_abilities
    print "...and thus by the process of elimiation\n"
    line_dashes
    show_what_was_set
    @ability_scores[@ability_names.first] = @score_totals.first
    @ability_names.delete(@ability_names.first)
    line_dashes
  end

  def multiple_checker
    if @score_totals.count(@select) > 1
      multiples_of_the_same_score = @score_totals.count(@select)
      @score_totals.delete(@select)
      @score_totals.fill(@select, @score_totals.size,multiples_of_the_same_score-1)
    else
      @score_totals.delete(@select)
    end
  end

  def calculate_bonuses
    puts "\nYour modifiers are as follows:"
    @ability_modifiers = @ability_scores.each {|k,v| puts "#{k[0..2].upcase}  #{(((v / 2).floor) -5)}"} # this is bad!!! help.
  end

  def validate_user_input
    if @score_totals.include?(@select)
      multiple_checker
      show_what_was_set
      @ability_scores[@ability_names.first] = @select
      @ability_names.delete(@ability_names.first)
    else
      puts "\nPlease enter a score that is one of the remaining #{@score_totals.count} ability scores\n"
    end
  end

  def line_dashes
    print "-" * 75
  end

  def user_input
    @select = gets.chomp.to_i
  end

  def show_what_was_set
    print "\nYour #{@ability_names.first.upcase} has been set to #{@select}!\n"
  end

  def start_description
    puts "\nTo begin we are rolling 4 D6's and if any of those rolls are a 1, we reroll it"
    puts "Then we remove the lowest number and the remaining 3 die add up to become one of your scores"
    puts "This is done 6 times, aka 1 time for each ability"
    puts "We have let the computer do the rolling for you to save time"
    puts "Oh, and in the event the total of those rolls is less than 78, we automatically do it all over again!"
    puts "Alright lets see what you got\n"
  end

  private

  ABILITY_NAMES = ["Strength", "Dexerity", "Constitution", "Intelligence", "Wisdom", "Charisma"].freeze
end





