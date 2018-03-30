require 'pry'

module BinaryTree

  # Definition for binary tree node

  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val)
      @val = val
      @left, @right = nil, nil

    end

  end

  # @param {Integer[]} inorder
  # @param {Integer[]} postorder
  # @return {TreeNode}

  def self.build_tree(in_order, postorder)
    in_order_map = {}
    in_order.each_with_index{|num, index|   in_order_map[num] = index}

    self._build_tree_(postorder, 0, postorder.size, in_order, 0, in_order.size, in_order_map)

  end


  private

  def self._build_tree_(preorder, pl, pu, in_order, il, iu, in_order_map)
    return nil  if pu - pl <= 0

    num = preorder[pl]
    return TreeNode.new(num) if pu - pl == 1

    im = in_order_map[num]
    pm = pl + 1 + (im - il)

    ltree = self._build_tree_(preorder, pl + 1, pm, in_order, il, im, in_order_map)
    rtree = self._build_tree_(preorder, pm, pu,  in_order, im + 1, il, in_order_map)

    root = TreeNode.new(num)
    root.left, root.right = ltree, rtree
    root

  end


  in_order = [9,3,15,20,7]
  postorder = [9,15,7,20,3]

  tree = BinaryTree.build_tree(in_order, postorder)

end