# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)

  nums.each do |num_i|
    nums.drop(1).each do |num_j|
      if num_i == num_j
        return true
      end
    end
    return false
  end
end