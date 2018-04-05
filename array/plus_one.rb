require 'pry'
require 'benchmark'

# @param {Integer[]} digits
# @return {Integer[]}

def plus_one(digits)

  sum, carry = [], 1

  digits.reverse_each do |digit|

    if carry.nonzero?
      value = digit + carry
      carry, value = value.divmod(10)
    else
      value = digit
    end

    sum.insert(0, value)
  end
  sum.insert(0, carry) if carry.nonzero?

  sum

end

digits = [0, 2, 3, 5]

plus_one digits

