require "./constant"
require "./player"

class Com < Player
  def put_stone(putable_cells)
    cell = putable_cells.sample #空きますからランダムに1つ取得
    row = ROW_NUM.key(cell[0])
    col = COL_NUM.key(cell[1])
    move = col + row
    print(move)
    return cell
  end
end
