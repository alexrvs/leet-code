module BinaryTree
  class Node
    attr_accessor :left, :right, :val

    def initialize(val)
      @val = val
      @left, @right = nil, nil
    end
  end

  tree = BinaryTree::Node.new(3)
  tree.left = BinaryTree::Node.new(9)
  tree.right = BinaryTree::Node.new(20)
  tree.right.left = BinaryTree::Node.new(15)
  tree.right.right = BinaryTree::Node.new(7)


  class Level
    attr_reader :tree

    def initialize(tree)
      @tree = tree
    end

    def level_order
      results = []
      queue = []
      return [] if @tree.nil?
      queue << @tree

      while !queue.empty? do

        next_node = queue.shift
        print "#{next_node.val}"

        if !next_node.left.nil?
          queue << next_node.left
        end

        if !next_node.right.nil?
          queue << next_node.right
        end

      end
      results
    end

    def post_order(node)
      return [] if node.nil?
      results = []
      results.concat post_order(node.left)
      results.concat post_order(node.right)
      results << node.val
      results
    end


    def level_order_recursive(tree)
      return [] if tree.nil?
      results = []
      results << level_order_recursive(tree.left)
      results << level_order_recursive(tree.right)
      results << tree.val
      results
    end

    def show_tree
      @tree.inspect
    end

  end

  puts "Level order traversal of tree :"
  self::Level.new(tree).level_order
  puts ""
  puts ""

  puts 'LeetCode test example'
  puts 'Tree'
  puts self::Level.new(tree).show_tree
  puts 'tree'

  puts self::Level.new(tree).level_order_recursive(tree)
  puts 'LeetCode test example'
end


