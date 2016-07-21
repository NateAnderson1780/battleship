require 'terminal-table'
require 'pry'

class Board
  attr_accessor :table 
  
  def initialize
    @table = Terminal::Table.new do |t|
      t << [".", "1", "2", "3", "4"]
      t << :separator
      t.add_row ["A", "", "", "", ""]
      t.add_separator
      t.add_row ["B", "", "", "", ""]
      t.add_separator
      t.add_row ["C", "", "", "", ""]
      t.add_separator
      t.add_row ["D", "", "", "", ""]
    end
    @rows = [[".", "1", "2", "3", "4"], ["A", "", "", "", ""], ["B", "", "", "", ""], ["C", "", "", "", ""], ["D", "", "", "", ""]]
  end
  
  def update_rows(coordinate, hit_or_miss)
    @rows = @rows.each do |row|
      if row.include?(coordinate[0])
        row[coordinate[1].to_i] << hit_or_miss 
      else
        row
      end
    end
    update_table
  end
  
  def update_table
    @table = Terminal::Table.new do |t|
      t << @rows[0]
      t << :separator
      t.add_row @rows[1]
      t.add_separator
      t.add_row @rows[2]
      t.add_separator
      t.add_row @rows[3]
      t.add_separator
      t.add_row @rows[4]
    end
  end
end


