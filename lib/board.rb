require 'set'
class Board
  GRID_DIMENSIONS = 3
  attr_reader :grid, :row, :column, :diagonal, :mark, :game_state, :game_end
  
  def initialize(grid = default_grid)
    @grid = grid
    @mark = mark
    @game_state = game_state
  end

  def place_move(value, row, column)
    
    if value != 0 and row != 0 and column != 0
      if row <= @grid.length and column <= @grid.length
        @grid[row-1][column-1] = value
      else
        puts "put in a value within the grid limits\n"
      end
    end
    puts ""
    @grid.each do |row|
      print row.to_s + "\n"
    end
    puts ""
    @grid
  end

  def place_move_new(value, position)
    grid[position-1] = value
  end

  def rows
    grid.each_slice(GRID_DIMENSIONS).to_a
  end

  def columns 
    rows.transpose
  end

  def diagonals
    diagonal_1 = rows.map.with_index {|item, index| item[index]}
    diagonal_2 = rows.reverse.map.with_index {|item, index| item[index]}

    [diagonal_1, diagonal_2]
  end

  # check row combinations
  def check_combinations_in_row

    @row = Array.new
    @grid.each do |i|
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
  def check_combinations_in_column
    
    @column = Array.new
    (0...grid.length()).each do |i|
      temp = Array.new
      (0...grid.length()).each do |y|
        temp.append(grid[y][i])    
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

  def check_combinations_in_diagonals
    
    first_column = 0
    last_column = -1
    @diagonal = Array.new
    temp = Array.new 
    diagonal_forward = Array.new
    diagonal_reverse = Array.new
    (0...grid.length()).each do |y|
      
      # check forward
      diagonal_forward.append(grid[y][first_column])
      first_column += 1
      
      # check in reverse
      diagonal_reverse.append(grid[y][last_column])
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
  
  def to_check_the_state_of_game(row = @row,column = @column,diagonal = @diagonal)
    diagonal.append("nil")
    if column.include?("X wins") or row.include?("X wins") or diagonal.include?("X wins")
      # puts "\nX wins"
      @game_state = "Done"
      @game_end = "X wins"
    elsif column.include?("O wins") or row.include?("O wins") or diagonal.include?("O wins")
      # puts "\nO wins"
      @game_state = "Done"
      @game_end = "O wins"
    elsif column.include?("Ongoing") or row.include?("Ongoing") or diagonal.include?("Ongoing")
      @game_state = "Ongoing"
    else
      # puts "\nThe game is tied"
      @game_state = "Done"
      @game_end = "Tied"
    end
  end

  def decide_player_turn
    count = 0

    @grid.each do |row|
      row.each do |elements|
        if elements != ""
          count += 1
        end
      end
    end

    if count < 9
      if count % 2 == 0 or count == 0
        @mark = "X"
        @mark
      else
        @mark = "O"
        @mark
      end
    else 
      "Done"
    end
  end

  private

  def default_grid

    Array[
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ]
  end
end
