require './lib/board'
require './lib/ship_placement'

class Game
  attr_reader :player_guesses,
              :computer_guesses
  
  def initialize(computer_two_unit_ship, computer_three_unit_ship, player_two_unit_ship, player_three_unit_ship)
    puts "LETS PLAY SOME BATTLESHIP!!!!"
    @player_coordinates       = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @computer_coordinates     = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @player_guesses           = []
    @computer_guesses         = []
    @player_two_unit_ship     = player_two_unit_ship
    @player_three_unit_ship   = player_three_unit_ship
    @computer_two_unit_ship   = computer_two_unit_ship
    @computer_three_unit_ship = computer_three_unit_ship
    @player_board             = Board.new 
    @computer_board           = Board.new
    @game_has_ended           = false
  end

  def play_the_game
    player_shot_sequence
  end
  
  def player_shot_sequence
    # print some player instructions
    # get player guess
    # validate player guess
    while !@game_has_ended do
      puts "---------------------"
      puts "YOU'RE UP!!!!"
      puts @computer_board.table 
      puts "Which position would you like to fire at?"
      player_shot = gets.chomp
      validate_coordinate(player_shot)
      update_player_guesses(player_shot)
      check_if_computer_hit(player_shot)
      break if @game_has_ended
      puts @computer_board.table 
      hit_enter_to_end_turn("player")
    end
  end
  
  def computer_shot_sequence
    computer_shot = @computer_coordinates.sample.split
    @computer_coordinates -= computer_shot
    update_computer_guesses(computer_shot)
    check_if_player_hit(computer_shot)
  end
  
  def validate_coordinate(player_shot)
    case 
    when @player_coordinates.include?(player_shot)
      validate_unique_guess(player_shot)
    else 
      puts "Please try again, that is not a valid coordinate."
      play_the_game
    end 
  end
  
  def validate_unique_guess(player_shot)
    case 
    when @player_guesses.include?(player_shot)
      puts "Please try again, you have guessed that previously."
      play_the_game
    else
      true 
    end
  end
  
  def update_player_guesses(player_shot)
    @player_guesses << player_shot 
  end
  
  def update_computer_guesses(computer_shot)
    @computer_guesses << computer_shot.join 
  end
  
  def check_if_computer_hit(player_shot)
    case 
    when @computer_two_unit_ship.include?(player_shot) 
      puts "YOU HAVE HIT THE 2 UNIT SHIP!!"
      @computer_board.update_rows(player_shot, "H")
      check_if_computer_ship_sunk
    when @computer_three_unit_ship.include?(player_shot)
      puts "YOU HAVE HIT THE 3 UNIT SHIP!!!"
      @computer_board.update_rows(player_shot, "H")
      check_if_computer_ship_sunk
    else
      puts "Bummer, that one's a miss."
      @computer_board.update_rows(player_shot, "M")
    end  
  end
  
  def check_if_computer_ship_sunk
    case 
    when ((@computer_two_unit_ship + @computer_three_unit_ship) - @player_guesses).empty?
      end_game_sequence_player_win
    when (@computer_two_unit_ship - @player_guesses).empty?
      puts "2 UNIT SHIP IS SUNK"
    when (@computer_three_unit_ship - @player_guesses).empty?
      puts "3 UNIT SHIP IS SUNK"
    end
  end
  
  def check_if_player_hit(computer_shot)
    case 
    when @player_two_unit_ship.include?(computer_shot.join) 
      puts "The computer fired at position #{computer_shot.join} and hit your 2 unit ship :("
      @player_board.update_rows(computer_shot.join, "H")
      check_if_player_ship_sunk
    when @player_three_unit_ship.include?(computer_shot.join)
      puts "The computer fired at position #{computer_shot.join} and hit your 3 unit ship :("
      @player_board.update_rows(computer_shot.join, "H")
      check_if_player_ship_sunk
    else
      puts "THEY MISSED! IN YO FACE COMPUTER!"
      @player_board.update_rows(computer_shot.join, "M")
      puts @player_board.table
      hit_enter_to_end_turn("computer")
    end  
  end
  
  def check_if_player_ship_sunk
    case 
    when ((@player_two_unit_ship + @player_three_unit_ship) - @computer_guesses).empty?
      end_game_sequence_computer_win
    when (@player_two_unit_ship - @computer_guesses).empty?
      puts "The computer sunk your 2 unit ship."
      puts @player_board.table
      hit_enter_to_end_turn("computer")
    when (@player_three_unit_ship - @computer_guesses).empty?
      puts "The computer sunk your 3 unit ship."
      puts @player_board.table
      hit_enter_to_end_turn("computer")
    else
      puts @player_board.table
      hit_enter_to_end_turn("computer")
    end
  end
  
  def hit_enter_to_end_turn(computer_or_player)
    puts "Please hit enter to end turn"\
         "\n---------------------------------"
    input = gets.chomp
    if input == "" && computer_or_player == "player"
      computer_shot_sequence
    elsif input == "" && computer_or_player == "computer"
    else  
      hit_enter_to_end_turn(computer_or_player)
    end
  end
  
  def end_game_sequence_player_win
    puts "-----------------------------------------------"\
         "\nCONGRATS! YOU WIN BATTLESHIP!!!!"\
         "\nYOUUUUUUU ARE THE CHAAAAAAMPION, MY FRRRIIIEEND!!"\
         "\n------------------------------------------------"\
         "\nIt took you #{player_guesses.count} shots to win."
    @game_has_ended = true
  end
  
  def end_game_sequence_computer_win
    puts "Wah wah, you lose"\
         "\n----------------"\
         "\nIt took the computer #{computer_guesses.count} shots to win." 
    @game_has_ended = true
  end
end