require './Player'
require './Question'
## Top level class - Handles Player objects, question objects along with game logic
class Game
  def initialize(player_one_name, player_two_name)
    @player_one = Player.new(player_one_name)
    @player_two = Player.new(player_two_name)
    @question_to_ask = Question.new
    @current_player = @player_one
  end
  #Returns true if the answer is correct
  def isAnswer?(answer, question_to_ask)
    if answer == @question_to_ask.answer
      puts "#{@current_player.name}: Good job!"
      return true
    else
      puts " #{@current_player.name}: Wrong!"
      return false
    end
  end
  #Asks the questions and checks if the answer is correct
  def ask_question()
    puts "#{@current_player.name}: #{@question_to_ask.question}"
    answer = self.get_answer()
    self.isAnswer?(answer, @question_to_ask)
  end
  #Gets user input
  def get_answer()
    input = gets.chomp.to_i
    return input
  end
  #Takes away point when answered wrong
  def answered_wrong(player)
    player.num_of_lives -= 1
  end

  def display_lives()
    puts "P1: #{@player_one.num_of_lives}/3 P2: #{@player_two.num_of_lives}/3 "
  end
  # Handles turns(switch players), generates new question to ask and displays the current lives remaining
  def turn_setup()
    @current_player = @player_one == @current_player ? @player_two : @player_one
    @question_to_ask = Question.new()
    display_lives()
  end
  # Handles what to display when the game is over
  def game_over(winner)
    winner == @player_one ? winner = @player_two : winner = @player_one
    puts "#{winner.name} wins with the score of #{winner.num_of_lives}/3"
    puts "Goodbye!"
  end
  
  # Start of the game
  def game_start()
    loop do 
      answer = ask_question()
      if(answer == false)
        self.answered_wrong(@current_player)
        if(@current_player.num_of_lives == 0)
          return self.game_over(@current_player)
        end
      end   
      self.turn_setup() 
      puts "---------------- NEW TURN -----------------"
      break if ( @player_one.num_of_lives == 0 || @player_two.num_of_lives == 0 )
    end 
  end
end