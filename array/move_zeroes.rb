require 'pry'
require 'benchmark'

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

def move_zeroes(nums)

  idx = nums.index(0)
  return if idx.nil?

  cursor = idx

  idx.upto(nums.size - 1) do |i|
    if nums[i].nonzero?

      nums[cursor] = nums[i]
      cursor += 1
    end
  end

  idx = cursor

  idx.upto(nums.size - 1) do |i|
    nums[i] = 0
  end;nil

  return nums
end

nums = [4,2,4,0,0,3,0,5,1,0]

print move_zeroes nums