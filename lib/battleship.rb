require './lib/ship_layout'
require './lib/rules'
require './lib/board'
require 'pry'

class Battleship
  def initialize
    
  end
  
  def self.game_initiation(input)
    # use case statement?
    if input == "p" || input == "play"
      start_game
    elsif input == "i" || input == "instructions"
      instructions
    elsif input == "q" || input == "quit"
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
    binding.pry
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.
The first is two units long and the second is three units long.
The grid has A1 at the top left and D4 at the bottom right.
    
Enter the squares for the two-unit ship:"
    input = gets.chomp 
  end
  
  def self.instructions
    puts "The game Battleship is played with two players who each have a 2 unit ship
    and a 3 unit ship.  Each player takes turns choosing coordinates to see if they have hit
    the opponent's ship.  The game is played until one player hits all points on an opponent
    player's ship."
    welcome_message
  end
  
  def self.welcome_message
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp 
    game_initiation(input)
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
end

Battleship.welcome_message


