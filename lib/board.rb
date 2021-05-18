require 'set'
class Board
  attr_reader :grid, :row, :column, :diagonal
  
  def initialize
    @grid = Array[
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ]
  end

  def place_move(value, row, column)
    
    if value != 0 and row != 0 and column != 0
      @grid[row-1][column-1] = value
    end

    @grid
  end

  # check row combinations
  def check_combinations_in_row(grid_used=@grid)

    @row = Array.new
    grid_used.each do |i|
      temp = i.uniq
      if temp.length == 1 and temp.include?("X")
        @row.append("X wins")
      elsif temp.length == 1 and temp.include?("O")
        @row.append("O wins")
      elsif temp.include?("")
        @row.append("Ongoing")
      else
        @row.append("Tied")
      end
    end
    return @row
  end

  # check column combinations 
  def check_combinations_in_column(grid_used=@grid)
    
    @column = Array.new
    (0...grid_used.length()).each do |i|
      temp = Array.new
      (0...grid_used.length()).each do |y|
        temp.append(grid_used[y][i])    
      end
      temp=temp.uniq
      if temp.length == 1 and temp.include?("X")
        @column.append("X wins")
      elsif temp.length == 1 and temp.include?("O")
        @column.append("O wins")
      elsif temp.include?("")
        @column.append("Ongoing")
      else
        @column.append("Tied")
      end
    end
    return @column
  end

  def check_combinations_in_diagonals(grid_used=@grid)
    
    first_column = 0
    last_column = -1
    @diagonal = Array.new
    temp = Array.new 
    diagonal_forward = Array.new
    diagonal_reverse = Array.new
    (0...grid_used.length()).each do |y|
      
      # check forward
      diagonal_forward.append(grid_used[y][first_column])
      first_column += 1
      
      # check in reverse
      diagonal_reverse.append(grid_used[y][last_column])
      last_column -= 1
    end
    temp.append(diagonal_forward.uniq,diagonal_reverse.uniq) 
    
    temp.each do |i|
      if i.length == 1 and i.include?("X")
        @diagonal.append("X wins")
      elsif i.length == 1 and i.include?("O")
        @diagonal.append("O wins")
      elsif i.include?("")
        @diagonal.append("Ongoing")
      else
        @diagonal.append("Tied")
      end
    end
    @diagonal
  end

end


