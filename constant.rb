#定数の定義
EMPTY = 0 #空きマス
BLACK = 1 #黒石のマス
WHITE = -1 #白石のマス
WALL = 2 #番兵(ひっくり返すときに使う)

ROW_NUM = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8} #行番号
COL_NUM = {"a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8} #列番号
COLOR = {BLACK => "黒", WHITE => "白"}

#ひっくり返せる方向
NONE = 0
UPPER_LEFT = 1
UPPER = 2
UPPER_RIGHT = 4
RIGHT = 8
LOWER_RIGHT = 16
LOWER = 32
LOWER_LEFT = 64
LEFT = 128
