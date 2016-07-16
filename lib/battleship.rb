class Battleship
  
  ship_place = ShipPlacement.new
  
  puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  input = gets.chomp 
  game_initation
  
  def game_initation
    if input == "p" || "play"
      ship_place.computer_place_ships
    elsif input == "i" || "instructions"
      
    elsif input == "q" || "quit"
      
    else 
      puts "please enter a valid choice"
      input = gets.chomp
      game_initation
    end
      
  end
  
  
  
end