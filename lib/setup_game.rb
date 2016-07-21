
class SetupGame
  def initialize 
  
  end
  
  def welcome_message
    # Message.welcome_message
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp 
    game_initiation(input)
  end

  def game_initiation(input)
    case input
    when "p", "play"
      true
    when "i", "instructions"
      instructions
    when "q", "quit"
      puts "Thanks for playing!"
      exit
    else 
      puts "Please enter a valid choice"
      input = gets.chomp
      game_initiation(input)
    end
  end
  
  def instructions
    puts "The game Battleship is played with two players who each have a 2 unit ship "\
         "and a 3 unit ship.  \nEach player takes turns choosing coordinates to see if they have hit "\
         "the opponent's ship.  \nThe game is played until one player hits all points on an opponent "\
         "player's ship."
    welcome_message
  end
end
