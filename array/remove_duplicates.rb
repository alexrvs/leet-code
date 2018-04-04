require 'pry'

#[1, 2, 3, 4, 2, 1, 5, 6, 7]
def remove_duplicates(nums)

  non_dupe_index = 0
  nums.each do |num|
    if (non_dupe_index == 0 || num > nums[non_dupe_index - 1])
      nums[non_dupe_index] = num
      non_dupe_index += 1
    end
  end
  nums.replace(nums)
  non_dupe_index

end