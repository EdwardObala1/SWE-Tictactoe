class Board
  $grid_with_moves=Array[
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ]
  def grid
    return $grid_with_moves
  end

  def self.place_move(value,row,column)
    
    if value != 0 and row != 0 and column != 0
      $grid_with_moves[row-1][column-1]=value
    end
    return $grid_with_moves
  end
end
