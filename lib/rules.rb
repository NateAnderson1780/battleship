require 'pry'

class Rules 
  def self.validate_two_unit(ship)
    letter0 = ship[0][0] 
    letter1 = ship[1][0]
    number0 = ship[0][1]
    number1 = ship[1][1]
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
  
  def self.separate_letters_and_numbers(ship)
    letter0 = ship[0][0] 
    letter1 = ship[1][0]
    letter2 = ship[2][0]
    number0 = ship[0][1]
    number1 = ship[1][1]
    number2 = ship[2][1]
    letters_good_three_unit?(letter0, letter1, letter2) && numbers_good_three_unit?(number0, number1, number2)
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