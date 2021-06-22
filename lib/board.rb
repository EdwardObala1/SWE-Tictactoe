require 'set'
class Board
  GRID_DIMENSIONS = 3
  attr_reader :grid
  
  def initialize(grid = default_grid)
    @grid = grid 
  end

  def place_move(value, position)
    if free?(grid[position - 1])
      grid[position-1] = value
    end
  end

  def winner?
    lines = rows + columns + diagonals
    lines.any? do |line|
      line.all? { |cell| cell == line[0] && !free?(cell)}
    end
  end

  def tied?
    !winner? && !grid.include?('')
  end

  def current_player
    grid.count('').odd? ? 'X' : 'O'
  end

  def rows
    grid.each_slice(GRID_DIMENSIONS).to_a
  end

  def opponent(mark)
    mark == "X" ? "O" : "X"
  end

  def free?(cell)
    cell == ''
  end

  def available_moves
    @grid.map.with_index do |cell, index|
      index + 1 if free?(cell)
    end.compact
  end

  private

  def default_grid
    Array[
      "", "", "",
      "", "", "",
      "", "", ""
    ]
  end

  def columns 
    rows.transpose
  end

  def diagonals
    diagonal_1 = rows.map.with_index {|item, index| item[index]}
    diagonal_2 = rows.reverse.map.with_index {|item, index| item[index]}

    [diagonal_1, diagonal_2]
  end
end
