require 'pry'
require 'benchmark'


module BinarySearch

  # @param nums {Integer[]}
  # @param target {Integer}
  # @return {Integer}

  def self.b_search(nums, target)
    l = -1
    r = nums.length

    while l < r - 1

      m = (l + r)/2

      if nums[m] < target
        l = m
      else
        r = m
      end

    end
    return r
  end


  def self.native_b_search(nums, target)
    nums.each_with_index.to_a.bsearch {|(x, index)| x >= target}
  end

  def self.bsearch2(nums, target)
    nums.bsearch{|el| el == target }
  end


  def self.recursive_b_search(nums, target)
    low, hi = get_limits nums
    return false if low >= hi

    mid = (low + hi) / 2

    if nums[mid] == target
      mid
    elsif nums[mid] < target
      self.native_b_search nums[(mid+1)..hi], target
    else
      self.native_b_search  nums[low..hi], target
    end

  end

  def self.get_limits(a)
      [0, a.length - 1]
  end

  class << self
    private :get_limits
  end

end

array = 100000.times.map{ rand(1500) }.sort
random_elements = 10000.times.map{ rand(2000)}

small_test_array = 1000.times.map{ rand(1000) }

Benchmark.bm do |x|
  x.report "Native B-Search".center(20) do
    random_elements.each{|el| BinarySearch.native_b_search(random_elements, el) }
  end

  x.report "Recursive B-Search".center(20) do
    random_elements.each{|el| BinarySearch.recursive_b_search(random_elements, el)}
  end

  x.report "Array#index".center(20) do
    random_elements.each{|el| random_elements.index(el) }
  end

  x.report "Array#bsearch".center(20) do
    random_elements.each{|el| random_elements.bsearch{|a| a == el }}
  end

  x.report "Custom B-Search".center(20) do
    random_elements.each{|el| BinarySearch.b_search(random_elements,el)}
  end
end

puts '|----------------Native B-Search---------------|'
puts BinarySearch.native_b_search random_elements, 750
puts '|----------------------------------------------|'


puts '|----------------Custom B-Search---------------|'
puts BinarySearch.b_search random_elements, 750
puts '|----------------------------------------------|'


puts '|----------------Recursive B-Search---------------|'
puts BinarySearch.recursive_b_search random_elements, 750
puts '|-------------------------------------------------|'

puts '|----------------Native 2 B-Search---------------|'
puts BinarySearch.bsearch2 random_elements, 750
puts '|-------------------------------------------------|'

