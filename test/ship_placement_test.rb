require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship_placement'

class ShipPlacementTest < Minitest::Test
  def test_build_computer_two_unit_ships
    ship_placement = ShipPlacement.new
    
    array = []
    5.times do 
      array << ship_placement.build_computer_two_unit_ships
    end
    
    assert_operator 4, :<=, array.uniq.count 
  end
  
  def test_build_computer_three_unit_ships
    ship_placement = ShipPlacement.new
    
    array = []
    5.times do 
      array << ship_placement.build_computer_three_unit_ships(["A1", "A2"])
    end
    
    assert_operator 4, :<=, array.uniq.count 
  end
  
  def test_build_user_ship
    ship_placement = ShipPlacement.new
    
    assert_equal ["C2", "D2"], ship_placement.build_user_ship("C2 D2")
    assert_equal ["A1", "B1", "C1"], ship_placement.build_user_ship("A1 B1 C1")
  end
  
  def test_start_game
    # ship_placement = ShipPlacement.new
    ship_placement = Minitest::Mock.new
    ship_placement.expect :start_game
    
    assert_instance_of Array, ship_placement.start_game
  end
  
  
end