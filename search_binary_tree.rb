require 'pry'
require 'benchmark'


module BinaryTree

  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val)
      @val, @left, @right = val, nil, nil
    end
  end

  class BSTSearcher

    attr_accessor :tree

    def initialize(tree)
      @tree = tree
    end


    def search_bst(root, val)
      return [] if root == nil

      case root.val <=> val
        when 1
          search_bst(root.right, val)
        when 0
          return root.val
        when -1
          search_bst(root.left, val)
        else
          return nil
      end

    end


    def search_bst2(root, val)

      return nil if root == nil

      if root.val != nil
        if root.val == val

          return root.val
        elsif root.val > val

          search_bst2 root.right, val
        elsif root.val < val

          search_bst2 root.left, val
        else

          return nil
        end

      end
    end


    def search_bst_iteration(root, val)
      return [] if root == nil
      @node = root

      while  @node != nil
      end

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
      target = 3
      searcher = BinaryTree::BSTSearcher.new(self.init)
      result = searcher.search_bst2(searcher.tree, target)
      result
    end

  end

end
puts '|---------- Search Binary Tree ----------|'
puts BinaryTree.run
puts '|----------------------------------------|'