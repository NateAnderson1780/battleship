class Rules 
  def self.validate_two_unit(ship)
    ship0_coordinate = ship[0].split 
    ship1_coordinate = ship[1].split
    letter0 = ship0_coordinate.first 
    letter1 = ship1_coordinate.first
    number0 = ship0_coordinate.last
    number1 = ship1_coordinate.last
    letters_good_two_unit?(letter0, letter1) && numbers_good_two_unit?(number0, number1)
  end
  
  def self.letters_good_two_unit?(letter0, letter1)
    if letter0 == letter1 || letter0.succ == letter1 || letter1.succ == letter0
      true
    else
      false
    end
  end
  
  def self.numbers_good_two_unit?(number0, number1)
    if number0 == number1 || number0.succ == number1 || number1.succ == number0
      true
    else
      false
    end
  end
  
  def self.validate_three_unit(ship)
    ship0_coordinate = ship[0].split 
    ship1_coordinate = ship[1].split
    ship2_coordinate = ship[2].split
    letter0 = ship0_coordinate.first 
    letter1 = ship1_coordinate.first
    letter2 = ship2_coordinate.first
    number0 = ship0_coordinate.last
    number1 = ship1_coordinate.last
    number2 = ship2_coordinate.last
    letters_good_three_unit?(letter0, letter1, letter2) && numbers_good_three_unit?(number0, number1, letter2)
  end
  
  def self.letters_good_three_unit?(letter0, letter1, letter2)
    if (letter0 == letter1 && letter1 == letter2) || (letter0.succ == letter1 && letter1.succ == letter2) 
      true
    else
      false
    end
  end
  
  def self.numbers_good_three_unit?(number0, number1, number2)
    if (number0 == number1 && number1 == number2) || (number0.succ == number1 && number1.succ == number2)
      true
    else
      false
    end
  end
end