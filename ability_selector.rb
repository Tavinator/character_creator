require './character_ability_roller'
class AbilitySelector
  def initialize()
    @ability_names = ["Strength", "Dexerity", "Constitution", "Intelligence", "Wisdom", "Charisma"]
    @@ability_scores = Hash.new()
    roller = CharacterAbilityRoller.new
    scores = roller.generate_character_scores
    @total = scores.inject(:+)
    @score_totals = scores.sort.reverse
  end

  def assign_abilities
    puts "\nYour total score is " + @total.to_s
    while @@ability_scores.count < 5
      puts "Your scores are: #{@score_totals.inspect}\n"
      puts "Of the following abilities\n #{@ability_names.inspect}\n"
      puts "What score do you want #{@ability_names.first} to be set to?\n"

      select = gets.chomp.to_i
      if @score_totals.include?(select)
        if @score_totals.count(select) > 1
          multiples_of_the_same_score = @score_totals.count(select)
          @score_totals.delete(select)
          @score_totals.fill(select, @score_totals.size,multiples_of_the_same_score-1)
        else
          @score_totals.delete(select)
        end
        puts "\nYour #{@ability_names.first} has been set to #{select}\n"
        @@ability_scores[@ability_names.first] = select
        @ability_names.delete(@ability_names.first)
      else
        puts "\nPlease enter a score that is one of the remaining #{@score_totals.count} ability scores\n"
      end
      @score_totals = @score_totals.sort.reverse
      puts @@ability_scores
    end
    puts "And thus by the process of elimiation"
    puts "Your #{@ability_names.first} has been set to #{select}\n"
    @@ability_scores[@ability_names.first] = @score_totals.first
    @ability_names.delete(@ability_names.first)
    puts @@ability_scores
  end
end

# puts "If you are NOT happy with those scores, please type in 'n'"
# puts "Otherwise we will continue to the next step of character creation"
# reselect = gets.chomp
#   if reselect == "n"
#     puts "lets restart this whole thing"
#     puts scores.sort.reverse.inspect
#   else
#     puts "lets go to skills"
#   end




