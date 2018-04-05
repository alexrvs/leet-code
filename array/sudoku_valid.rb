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
  binding.pry

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


puts is_valid_sudoku valid_board

puts is_valid_sudoku invalid_board