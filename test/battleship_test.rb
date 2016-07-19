require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_game_initiation
    array = []
   5.times do 
      array << Battleship.build_computer_two_unit_ships
    end
    
    assert_greater_than 4, array.uniq.count 
  end
end