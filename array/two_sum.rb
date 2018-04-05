require 'pry'
require 'benchmark'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  map = {}

  result, part_a, part_b = [], [], []

  temp = nums.combination(2)


  temp.each do |sum|
    if sum.reduce(:+) == target
      part_a = [nums.index(sum[0]), nums.index(sum[1])]
    end
  end

  nums.each_with_index do |num, index|
    i = map[target - num]
    part_b = [i + 1, index] if i
    map[num] = index
  end

  result << part_a[0]
  result << part_b[1]

  return result
end


def two_sum_a(nums, target)

  temp = nums.combination(2)
  temp.each do |sum|
    if sum.reduce(:+) == target
      return [nums.index(sum[0]), nums.index(sum[1])]
    end
  end

end

def two_sum_b(nums, target)
  map = {}

  nums.each_with_index do |num, index|

    i = map[target - num]

    return [i + 1, index + 1] if i

    map[num] = index
  end

end


def two_sum_c(nums, target)
  result = []
  hash = {}
  hash[nums[0]] = 0

  1.upto(nums.length - 1).each do |i|
    temp = target - nums[i]

    if hash.key?(temp)
      result << hash[temp]
      result << i
      return result
    else
      hash[nums[i]] = i
    end
  end

  result

end


nums = [3,3,4,6,2,2,2,4,4]
target = 6

print two_sum_c nums, target
