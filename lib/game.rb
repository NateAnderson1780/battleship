require './lib/board'
require './lib/ship_placement'

class Game
  def initialize(computer_two_unit_ship, computer_three_unit_ship, player_two_unit_ship, player_three_unit_ship)
    puts "LETS PLAY SOME BATTLESHIP!!!!"
    @possible_coordinates     = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @player_guesses           = []
    @computer_two_unit_ship   = computer_two_unit_ship
    @computer_three_unit_ship = computer_three_unit_ship
    @player_two_unit_ship     = player_two_unit_ship
    @player_three_unit_ship   = player_three_unit_ship
    @player_board             = Board.new 
    @computer_board           = Board.new
  end

  def play_the_game
    player_shot_sequence
    computer_shot_sequence
  end
  
  def player_shot_sequence
    puts @player_board.table 
    puts "Which position would you like to fire at?"
    input = gets.chomp
    validate_coordinate(input)
    update_guesses(input)
    check_if_computer_hit?(input)
    hit_enter_to_end_turn
  end
  
  def computer_shot_sequence
    computer_shot = @possible_coordinates.sample 
  end
  
  def validate_coordinate(input)
    case 
    when @possible_coordinates.include?(input)
      validate_unique_guess(input)
    else 
      puts "Please try again, that is not a valid coordinate."
      play_the_game
    end 
  end
  
  def validate_unique_guess(input)
    case input
    when @player_guesses.include?(input)
      puts "Please try again, you have guessed that previously."
      play_the_game
    else
      true 
    end
  end
  
  def update_guesses(input)
    @player_guesses << input 
  end
  
  def check_if_computer_hit?(input)
    binding.pry
    if @computer_two_unit_ship.include?(input) 
      puts "YOU HAVE HIT THE 2 UNIT SHIP!!"
      # update_board(input, "H")
      check_if_ship_sunk
    elsif  @computer_three_unit_ship.include?(input)
      puts "YOU HAVE HIT THE 3 UNIT SHIP!!!"
      # update_board(input, "H")
      check_if_ship_sunk
    else
      puts "Bummer, that one's a miss."
      # update_board(input, "M")
    end  
  end
  
  def check_if_ship_sunk
    case 
    when ((@computer_two_unit_ship + @computer_three_unit_ship) - @player_guesses).empty?
      # enter END GAME SEQUENCE
    when (@computer_two_unit_ship - @player_guesses).empty?
      puts "THE 2 UNIT SHIP IS NOW SUNK!!"
    when (@computer_three_unit_ship - @player_guesses).empty?
      puts "THE 3 UNIT SHIP IS NOW SUNK!!!"
    end
  end
  
  def hit_enter_to_end_turn
    puts "Please hit enter to end your turn"
    input = gets.chomp
    if input == ""
      true
    else
      hit_enter_to_end_turn
    end
  end
  
  def update_board(input)
    
  end
end