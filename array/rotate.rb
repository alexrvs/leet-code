# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.


def rotate(nums, k)
  k %= nums.length
  reverse(nums, 0, nums.length - 1)
  reverse(nums, 0, k - 1)
  reverse(nums, k, nums.length - 1)
end


def reverse(nums, start, end_index)

  while (start < end_index)
    temp = nums[start]
    nums[start] = nums[end_index]
    nums[end_index] = temp
    start += 1
    end_index -= 1
  end



end
