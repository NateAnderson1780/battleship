class ShipPlacement 
  attr_reader :computer_two_unit_ship,
              :computer_three_unit_ship,
              :player_two_unit_ship,
              :player_three_unit_ship
    
  def initialize
      
  end          
  
  def start_game
    @computer_two_unit_ship = build_computer_two_unit_ships
    @computer_three_unit_ship = build_computer_three_unit_ships(@computer_two_unit_ship)
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships."\
         "\nThe first is two units long and the second is three units long."\
         "\nThe grid has A1 at the top left and D4 at the bottom right."\
    
          "\n\nEnter the squares for the two-unit ship:"
    input = gets.chomp 
    @player_two_unit_ship = check_valid_user_coordinates(input)
    puts "Great job! Now enter the squares for the three-unit ship"
    input = gets.chomp 
    @player_three_unit_ship = check_valid_user_coordinates(input)
  end
  
  def build_computer_two_unit_ships
    possible_coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    ship = possible_coordinates.sample(2)
    if validate_two_unit(ship)
      ship
    else
      build_computer_two_unit_ships 
    end
  end
  
  def build_computer_three_unit_ships(two_unit_ship)
    possible_coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    three_unit_possible_coordinates = possible_coordinates - two_unit_ship 
    ship = three_unit_possible_coordinates.sample(3)
    if validate_three_unit(ship)
      ship
    else
      build_computer_three_unit_ships(two_unit_ship) 
    end
  end
  
  def build_user_two_unit_ships(new_input)
    if !letters_good_two_unit?(new_input[0][0], new_input[1][0])
      puts "Please try again, the letters entered are not valid."
      input = gets.chomp
      check_valid_user_coordinates(input)
    elsif !numbers_good_two_unit?(new_input[0][1], new_input[1][1])
      puts "Please try again, the numbers entered are not valid."
      input = gets.chomp
      check_valid_user_coordinates(input)
    else 
      @player_two_unit_ship = new_input 
    end
  end
  
  def build_user_three_unit_ships(input)
    new_input = input.split(" ")
    if !(new_input & @player_two_unit_ship).empty?
      puts "Please try again, this ship overlaps with your 2 unit ship."
      input = gets.chomp
      build_user_three_unit_ships(input)
    elsif !validate_three_unit(new_input)
      puts "Please try again, numbers and letter entered are not valid."
      input = gets.chomp
      build_user_three_unit_ships(input)
    elsif validate_three_unit(new_input)
      puts "GREAT! WE HAVE OUR SHIPS!"
      new_input 
    end
  end
  
  def check_valid_user_coordinates(input)
    new_input = input.split(" ")
    if new_input.count == 2
      build_user_two_unit_ships(new_input)
    else
      build_user_three_unit_ships(input)
    end
  end
  
  def validate_two_unit(ship)
    letter0 = ship[0][0]
    letter1 = ship[1][0]
    number0 = ship[0][1]
    number1 = ship[1][1]
    letters_good_two_unit?(letter0, letter1) && numbers_good_two_unit?(number0, number1)
  end
  
  def letters_good_two_unit?(letter0, letter1)
    if letter0 == letter1 || letter0.succ == letter1 || letter1.succ == letter0
      true
    else
      false
    end
  end
  
  def numbers_good_two_unit?(number0, number1)
    if number0 == number1 || number0.succ == number1 || number1.succ == number0
      true
    else
      false
    end
  end
  
  def validate_three_unit(ship)
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
  
  def letters_good_three_unit?(letters)
    sorted_letters = @letters.sort 
    if (sorted_letters[0] == sorted_letters[1]) && (sorted_letters[1] == sorted_letters[2])
      numbers_good_three_unit_same_letters?(@numbers)
    elsif (sorted_letters[0].succ == sorted_letters[1]) && (sorted_letters[1].succ == sorted_letters[2])
      numbers_good_three_unit_consecutive_letters?(@numbers)
    else
      false
    end
  end
  
  def numbers_good_three_unit_same_letters?(numbers)
    sorted_numbers = @numbers.sort
    if (sorted_numbers[0].succ == sorted_numbers[1]) && (sorted_numbers[1].succ == sorted_numbers[2])
      true
    else
      false
    end
  end
  
  def numbers_good_three_unit_consecutive_letters?(numbers)
    sorted_numbers = @numbers.sort
    if (sorted_numbers[0] == sorted_numbers[1]) && (sorted_numbers[1] == sorted_numbers[2])
      true
    else
      false
    end
  end
end