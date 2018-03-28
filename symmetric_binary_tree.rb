module BinaryTree
  class Node
    attr_accessor :val, :left, :right

    def initialize(val)
      @val, @left, @right = val, nil, nil
    end

  end


  symmetric_tree = BinaryTree::Node.new(1)
  symmetric_tree.left = BinaryTree::Node.new(2)
  symmetric_tree.right = BinaryTree::Node.new(2)
  symmetric_tree.left.left = BinaryTree::Node.new(3)
  symmetric_tree.left.right = BinaryTree::Node.new(4)
  symmetric_tree.right.left = BinaryTree::Node.new(3)
  symmetric_tree.right.right = BinaryTree::Node.new(4)



  unsymmetric_tree = BinaryTree::Node.new(1)
  unsymmetric_tree.left = BinaryTree::Node.new(2)
  unsymmetric_tree.right = BinaryTree::Node.new(2)
  unsymmetric_tree.left.left = BinaryTree::Node.new(nil)
  unsymmetric_tree.left.right = BinaryTree::Node.new(4)
  unsymmetric_tree.right.left = BinaryTree::Node.new(3)
  unsymmetric_tree.right.right = BinaryTree::Node.new(4)

  class TreeNode

    def initialize
    end

    def is_symmetric(root)
      unless root.nil?
        is_symmetric(root.left) == is_symmetric(root.right)
      end
    end

  end

  puts '|------------------------------|'
  puts '----------Symmetric-------------'
  puts self::TreeNode.new.is_symmetric unsymmetric_tree
  puts '|------------------------------|'

end


