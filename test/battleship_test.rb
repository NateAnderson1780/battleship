require_relative '../lib/battleship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BattleshipTest
  def test_welcome_message
    battleship = Battleship.new
    
    
  end
  
  def test_game_initiation
    
    
    assert_equal start_game, battleship.game_initiation("p")
  end
end