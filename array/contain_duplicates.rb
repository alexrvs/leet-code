require 'pry'

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  map = {}

  nums.each do |num|
    return true if map[num]
    map[num] = true

  end
  return false
end

nums = [2,14,18,22,22]
contains_duplicate nums