require 'pry'
require 'benchmark'

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  x,y = matrix.first.count, matrix.count
  row = []


  0.upto(y - 1) do |i|
    col = []
    0.upto(x -1) do |j|

        matrix[i][j] += 1


    end

  end
  return matrix
end


def rotate_a(matrix)

  row_x,col_y = matrix.first.count, matrix.count
  rotate_matrix = []

  0.upto(row_x - 1) do |j|
    row = []
    (col_y - 1).downto(0) do |i|
       row  << matrix[i][j]
    end
    rotate_matrix << row
  end

  return rotate_matrix

end


matrix =[[ 5, 1, 9,11],[ 2, 4, 8,10],[13, 3, 6, 7],[15,14,12,16]]

#print rotate matrix

matrix_c = [[1,2,3],[4,5,6],[7,8,9]]

print rotate_a matrix