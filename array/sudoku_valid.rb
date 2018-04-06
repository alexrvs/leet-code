require 'pry'
require 'benchmark'


# @param {Character[][]} board
# @return {Boolean}

def is_valid_sudoku(board)

  hash_indexes = {}

  board.each  do |board_line|

    board_line.each_with_index do |board_item, index|

      key = board_item.to_i

      if hash_indexes.key?(key) && hash_indexes[key] == index
        return false

      elsif !hash_indexes.key?(key)

        hash_indexes[key] = index
      end

    end

  end

  return true

end

def is_valid_sudoku_a(board)

  rowbuckets = Array.new(9) {Hash.new}
  collbuckets = Array.new(9) {Hash.new}
  boxbuckets = Array.new(9){Hash.new}


  0.upto(8) do |i|
    0.upto(8) do |j|
      char = board[i][j]
      next if char == "."

      return false if rowbuckets[i][char]
      rowbuckets[i][char] = true

      return false if collbuckets[j][char]
      collbuckets[j][char] = true

      k = (i / 3) * 3 + (j / 3)
      return false if boxbuckets[k][char]
      boxbuckets[k][char] = true

    end
  end
  return true

end


valid_board = [[".","8","7","6","5","4","3","2","1"],
         ["2",".",".",".",".",".",".",".","."],
         ["3",".",".",".",".",".",".",".","."],
         ["4",".",".",".",".",".",".",".","."],
         ["5",".",".",".",".",".",".",".","."],
         ["6",".",".",".",".",".",".",".","."],
         ["7",".",".",".",".",".",".",".","."],
         ["8",".",".",".",".",".",".",".","."],
         ["9",".",".",".",".",".",".",".","."]]

invalid_board = [["2","8","7","6","5","4","3","9","1"],
                 ["2",".",".",".",".",".",".",".","."],
                 ["3",".",".",".",".",".",".",".","."],
                 ["4",".",".",".",".",".",".",".","."],
                 ["5",".",".",".",".",".",".",".","."],
                 ["6",".",".",".",".",".",".",".","."],
                 ["7",".",".",".",".",".",".",".","."],
                 ["8",".",".",".",".",".",".",".","."],
                 ["9",".",".",".",".",".",".",".","."]]


puts is_valid_sudoku_a valid_board

puts is_valid_sudoku_a invalid_board