require 'terminal-table'

class Board
  attr_accessor :table 
  
  def initialize
    @table = Terminal::Table.new do |t|
      t << [".", "1", "2", "3", "4"]
      t << :separator
      t.add_row ["A", nil, nil, nil, nil]
      t.add_separator
      t.add_row ["B", nil, nil, nil, nil]
      t.add_separator
      t.add_row ["C", nil, nil, nil, nil]
      t.add_separator
      t.add_row ["D", nil, nil, nil, nil]
    end
  end
end

