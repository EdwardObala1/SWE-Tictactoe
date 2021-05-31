require 'set'
class Board
  GRID_DIMENSIONS = 3
  attr_reader :grid, :row, :column, :diagonal, :mark, :game_state, :game_end
  
  def initialize(grid = default_grid)
    @grid = grid
    @mark = mark
    @game_state = game_state
  end

  def place_move_new(value, position)
    if grid[position-1] == ''
      grid[position-1] = value
    else
      puts "\nThat position has already been played\n"
    end
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

  def winner?
    find_winner(rows) || find_winner(columns) || find_winner(diagonals)
  end

  def find_winner(lines)
    lines.each do |line|
      if line.uniq.length == 1 and line.include?('')
        next
      elsif line.uniq.length == 1
        @mark = line[0]
        return true
      end
    end
    return false #if empty or tied
  end

  def ongoing?(lines)
    if winner? == false
      lines.each do |line|
        if line.include?('')
          return true
        end
      end
      return false
    end
  end

  def get_player_turns
    count = 0
    grid.each do |i|
      if i != ""
        count += 1
      end
    end
    if count%2 == 0 
      "X"
    else
      "O"
    end
  end

  private

  def default_grid

    Array[
      "", "", "",
      "", "", "",
      "", "", ""
    ]
  end
end
