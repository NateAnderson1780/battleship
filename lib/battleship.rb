require './lib/game'
require './lib/rules'
require './lib/board'
require 'pry'

class Battleship
  def initialize
    
  end
  
  def self.welcome_message
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp 
    game_initiation(input)
  end
  
  def self.game_initiation(input)
    case input
    when "p", "play"
      start_game
    when "i", "instructions"
      instructions
    when "q", "quit"
      puts "Thanks for playing!"
    else 
      puts "Please enter a valid choice"
      input = gets.chomp
      game_initiation(input)
    end
  end
  
  def self.start_game
    @computer_two_unit_ship = validate_two_unit_ships
    @computer_three_unit_ship = validate_three_unit_ships(@computer_two_unit_ship)
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships."\
         "\nThe first is two units long and the second is three units long."\
         "\nThe grid has A1 at the top left and D4 at the bottom right."\
    
          "\n\nEnter the squares for the two-unit ship:"
    input = gets.chomp 
    @player_two_unit_ship = check_valid_user_coordinates(input)
    puts "Great job! Now enter the squares for the three-unit ship"
    input = gets.chomp 
    @player_three_unit_ship = check_user_three_unit_coordinates(input)
    
  end
  
  def self.instructions
    puts "The game Battleship is played with two players who each have a 2 unit ship "\
         "and a 3 unit ship.  \nEach player takes turns choosing coordinates to see if they have hit "\
         "the opponent's ship.  \nThe game is played until one player hits all points on an opponent "\
         "player's ship."
    welcome_message
  end
  
  def self.validate_two_unit_ships
    possible_coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    ship = possible_coordinates.sample(2)
    if Rules.validate_two_unit(ship)
      ship
    else
      validate_two_unit_ships 
    end
  end
  
  def self.validate_three_unit_ships(two_unit_ship)
    possible_coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    three_unit_possible_coordinates = possible_coordinates - two_unit_ship 
    ship = three_unit_possible_coordinates.sample(3)
    if Rules.validate_three_unit(ship)
      ship
    else
      validate_three_unit_ships(two_unit_ship) 
    end
  end
  
  def self.check_valid_user_coordinates(input)
    new_input = input.split(" ")
    if new_input.count == 2
      check_user_two_unit_coordinates(new_input)
    else
      check_user_three_unit_coordinates(input)
    end
  end
  
  def self.check_user_two_unit_coordinates(new_input)
    if !Rules.letters_good_two_unit?(new_input[0][0], new_input[1][0])
      puts "Please try again, the letters entered are not valid."
      input = gets.chomp
      check_valid_user_coordinates(input)
    elsif !Rules.numbers_good_two_unit?(new_input[0][1], new_input[1][1])
      puts "Please try again, the numbers entered are not valid."
      input = gets.chomp
      check_valid_user_coordinates(input)
    else 
      @player_two_unit_ship = new_input 
    end
  end
  
  def self.check_user_three_unit_coordinates(input)
    new_input = input.split(" ")
    if !(new_input & @player_two_unit_ship).empty?
      puts "Please try again, this ship overlaps with your 2 unit ship."
      input = gets.chomp
      check_user_three_unit_coordinates(input)
    elsif Rules.validate_three_unit(new_input)
      puts "GREAT! WE HAVE OUR SHIPS!"
      new_input 
    elsif !Rules.validate_three_unit(new_input)
      puts "Please try again, numbers and letter entered are not valid."
      input = gets.chomp
      check_user_three_unit_coordinates(input)
    end
  end
  
  Battleship.welcome_message
  new_game = Game.new(@computer_two_unit_ship, @computer_three_unit_ship, @player_two_unit_ship, @player_three_unit_ship)
  new_game.play_the_game
end



