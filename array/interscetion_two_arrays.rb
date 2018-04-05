require 'pry'
require 'benchmark'

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

def intersect(nums1, nums2)
  intersection = []

  nums1.map do |num|

    intersection << num if nums2.include?(num)

  end

  return intersection
end


def intersect_b(nums1, nums2)
  nums1 & nums2
end

def intersect_c(nums1, nums2)

  intersections = []

  nums1.each do |num_i|

    if nums2.include?(num_i) && nums2.map{|num_j|  nums1.include?(num_j)}
      intersections << num_i
    end

  end

  return intersections
end

def intersect_d(nums1, nums2)
  result = []
  for i in nums1
    if nums2.include?(i)
      result << i
      nums2.delete_at(nums2.index(i))
    end
  end

end

nums1 = [1, 2, 2, 3, 1]
nums2 = [1]