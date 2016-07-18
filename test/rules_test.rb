require './lib/rules'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RulesTest
  def test_separate_letters_and_numbers
    
    
    assert_equal true, Rules.separate_letters_and_numbers(["B4", "C4", "D4"])
  end
end