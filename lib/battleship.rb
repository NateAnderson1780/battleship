require './lib/setup_game'
require './lib/ship_placement'
require './lib/game'
require 'pry'

class Battleship
  setup_new_game = SetupGame.new 
  setup_new_game.welcome_message
  ship_placement = ShipPlacement.new
  ship_placement.start_game
  new_game = Game.new(ship_placement.computer_two_unit_ship, ship_placement.computer_three_unit_ship, ship_placement.player_two_unit_ship, ship_placement.player_three_unit_ship)
  new_game.play_the_game
end



