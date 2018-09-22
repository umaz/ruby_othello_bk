require "./constant"
require "./board"
require "./human"
require "./com"

class Game
  def initialize(mode, order, lv)
    case mode
    when COM
      case order
      when FIRST
        @first = Human.new(BLACK)
        @second = Com.new(WHITE, lv)
      when SECOND
        @first = Com.new(BLACK, lv)
        @second = Human.new(WHITE)
      end
    when HUMAN
      @first = Human.new(BLACK)
      @second = Human.new(WHITE)
    when WATCH
      @first = Com.new(BLACK, lv[0])
      @second = Com.new(WHITE, lv[1])
    end
    @turn = 0
    @player = @first #黒石からスタート
    @board = Board.new
    @board.show_board
    turn
  end

  #手番の流れ
  def turn
    case status
    when FINISH
      end_game
    when PASS
      print("#{@turn+1}手目\n")
      print("#{COLOR[-@player.color]}の手番です\n")
      print("パスしました\n")
      @board.show_board
      turn
    when MOVE
      putable_cells = @board.get_putable_cells(@player.color)
      print("#{COLOR[@player.color]}の手番です\n")
      print("#{@turn+1}手目:")
      move = @player.put_stone(putable_cells)
      row = move[0].to_i
      col = move[1].to_i
      @board.reverse(row, col, @player.color)
      @turn += 1
      @board.show_board
      change_turn
      turn
    end
  end

  #状態判定
  def status
    if @board.get_putable_cells(@player.color).size == 0
      change_turn
      if @board.get_putable_cells(@player.color).size == 0
        return FINISH
      else
        return PASS
      end
    else
      return MOVE
    end
  end

  def change_turn
    if @player == @first
      @player = @second
    else
      @player = @first
    end
  end

  def end_game
    count = @board.count
    black = count[0]
    white = count[1]
    if black > white
      print("\n黒:#{black} 対 白:#{white} で黒の勝ち\n\n")
      return BLACK
    elsif white > black
      print("\n黒:#{black} 対 白:#{white} で白の勝ち\n\n")
      return WHITE
    else
      print("\n黒:#{black} 対 白:#{white} で引き分け\n\n")
      return EMPTY
    end
  end
end