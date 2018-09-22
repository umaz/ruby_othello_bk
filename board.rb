require "./constant"

class Board
  #新しい盤
  def initialize
    #盤面を表す二重配列の作成
    @board = [
      [WALL,WALL,WALL,WALL,WALL,WALL,WALL,WALL,WALL,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,WHITE,BLACK,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,BLACK,WHITE,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,EMPTY,WALL], 
      [WALL,WALL,WALL,WALL,WALL,WALL,WALL,WALL,WALL,WALL]
    ]
  end

  attr_reader :board

  #現在の盤の状態を表示
  def show_board
    print("\n\n  #{COL_NUM.keys.join(" ")}\n") #列
    @board.slice(1...-1).each_with_index do |row, i| #番兵を除く
      print(ROW_NUM[(i+1).to_s])
      row.each do |col|
        case col
        when EMPTY
          print "\e[32m"
          print(" □")
          print "\e[0m"
        when BLACK
          print(" ○")
        when WHITE
          print(" ●")
        end
      end
      print("\n")
    end
    print("\n")
  end
end

board = Board.new
board.show_board