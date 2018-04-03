require 'pry'
require 'benchmark'


module BinaryTree

  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val)
      @val, @left, @right = val, nil, nil
    end

  end

  class << self

    # @param {TreeNode} root
    # @param {Array} nums
    # @return {Integer[]}

    def helper_node(root, nums)
      return if root == nil

      helper_node(root.left, nums)
      nums << root.val
      helper_node(root.right, nums)
    end


    # @param {TreeNode} root
    # @return {Boolean}

    def is_valid_bst(root)
      nums = []

      helper_node(root, nums)

      1.upto(nums.length - 1) do |i|
        return false if nums[i - 1] >= nums[i]
      end
      return true

    end

  end

  def self.valid_tree
    tree = self::TreeNode.new(2)
    tree.left = self::TreeNode.new(1)
    tree.right = self::TreeNode.new(3)
    tree
  end

  def self.invalid_tree
    tree = self::TreeNode.new(1)
    tree.left = self::TreeNode.new(2)
    tree.right = self::TreeNode.new(3)
    tree
  end


end

print @v_tree = BinaryTree.valid_tree
print @i_tree = BinaryTree.invalid_tree

puts BinaryTree.is_valid_bst @v_tree
puts BinaryTree.is_valid_bst @i_tree