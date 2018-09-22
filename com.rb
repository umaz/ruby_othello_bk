require "./constant"
require "./player"

class Com < Player
  def initialize(color, lv)
    super(color) #親クラスのメソッド呼び出し
    @lv = lv
  end

  def put_stone(putable_cells)
    case @lv
    when 1
      cell = lv1(putable_cells)
    when 2
      cell = lv2(putable_cells)
    end
    row = ROW_NUM.key(cell[0])
    col = COL_NUM.key(cell[1])
    move = col + row
    print(move)
    return cell
  end

  def lv1(putable_cells)
    return putable_cells.sample #空きますからランダムに1つ取得
  end

  #BOARD_SCOREのもっとも大きくなるマスに石を打つ
  def lv2(putable_cells)
    score = -9999
    put_cell = []
    putable_cells.each do |cell|
      if BOARD_SCORE[cell[0]][cell[1]] > score
        put_cell = cell
        score = BOARD_SCORE[cell[0]][cell[1]]
      end
    end
    return put_cell
  end
end
