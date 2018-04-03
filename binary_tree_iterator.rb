require 'pry'
require 'benchmark'


module BinaryTree

  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val)
      @val, @left, @right = val, nil, nil
    end
  end

  class BSTIterator

    # @param {TreeNode}

    def initialize(root)
      @stack = []
      helper(root)
    end

    # @param {TreeNode}

    def helper(node)
      while node != nil
        @stack << node
        node = node.left
      end
    end

    # @return {Boolean}

    def has_next
      return true if(@stack.length != 0)
    end

    # @return {Integer}

    def next
      node = @stack.pop
      helper(node.right)
      node.val
    end

  end

  class << self

    def init

      tree = BinaryTree::TreeNode.new(2)
      tree.left = BinaryTree::TreeNode.new(3)
      tree.right = BinaryTree::TreeNode.new(5)
      tree.left.left = BinaryTree::TreeNode.new(7)
      tree.left.right = BinaryTree::TreeNode.new(8)
      tree.right.left = BinaryTree::TreeNode.new(4)
      tree.right.right = BinaryTree::TreeNode.new(9)
      tree
    end

    def run
      iterator, node = BinaryTree::BSTIterator.new(self.init), []

      while iterator.has_next()
        node << iterator.next
      end
      node
    end

  end

end
