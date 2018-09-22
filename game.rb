require "./constant"
require "./board"

class Game
  def initialize()
    @turn = 0
    @first = BLACK
    @second = WHITE
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
      print("#{COLOR[-@player]}の手番です\n")
      print("パスしました\n")
      print("確認(何か入力してください)")
      gets
      @board.show_board
      turn
    when MOVE
      putable_cells = @board.get_putable_cells(@player)
      print("#{COLOR[@player]}の手番です\n")
      print("#{@turn+1}手目:")
      cell = gets.chomp.split("")
      col = COL_NUM[cell[0]]
      row = ROW_NUM[cell[1]]
      @board.reverse(row, col, @player)
      @turn += 1
      @board.show_board
      change_turn
      turn
    end
  end

  #状態判定
  def status
    if @board.get_putable_cells(@player).size == 0
      change_turn
      if @board.get_putable_cells(@player).size == 0
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

Game.new