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
  
  def self.validate_three_unit(ship)
    @letters = []
    @numbers = []
    @letters << ship[0][0]
    @letters << ship[1][0]
    @letters << ship[2][0]
    @numbers << ship[0][1]
    @numbers << ship[1][1]
    @numbers << ship[2][1]
    letters_good_three_unit?(@letters) 
  end
  
  def self.letters_good_three_unit?(letters)
    sorted_letters = @letters.sort 
    if (sorted_letters[0] == sorted_letters[1]) && (sorted_letters[1] == sorted_letters[2])
      numbers_good_three_unit_same_letters?(@numbers)
    elsif (sorted_letters[0].succ == sorted_letters[1]) && (sorted_letters[1].succ == sorted_letters[2])
      numbers_good_three_unit_consecutive_letters?(@numbers)
    else
      false
    end
  end
  
  def self.numbers_good_three_unit_same_letters?(numbers)
    sorted_numbers = @numbers.sort
    if (sorted_numbers[0].succ == sorted_numbers[1]) && (sorted_numbers[1].succ == sorted_numbers[2])
      true
    else
      false
    end
  end
  
  def self.numbers_good_three_unit_consecutive_letters?(numbers)
    sorted_numbers = @numbers.sort
    if (sorted_numbers[0] == sorted_numbers[1]) && (sorted_numbers[1] == sorted_numbers[2])
      true
    else
      false
    end
  end
end