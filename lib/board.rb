class Board
  def grid
    [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
      ]
  end

  def place_move(value,row,column)
    [
        ["", "", ""],
        ["", "", "X"],
        ["", "", ""]
      ]
  end
end