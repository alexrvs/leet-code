module BinaryTree
  class Node
    attr_accessor :left, :right, :val

    def initialize(val)
      @val = val
      @left, @right = nil, nil
    end
  end


  # tree = BinaryTree::Node.new(1)
  # tree.left = BinaryTree::Node.new(2)
  # tree.left.left = BinaryTree::Node.new(nil)
  # tree.left.left.left = BinaryTree::Node.new(3)
  # tree.left.left.left.left = BinaryTree::Node.new(nil)
  # tree.left.left.left.left.left = BinaryTree::Node.new(4)
  # tree.left.left.left.left.left.left = BinaryTree::Node.new(nil)
  # tree.left.left.left.left.left.left.left = BinaryTree::Node.new(5)


  tree = BinaryTree::Node.new(1)
  tree.left = BinaryTree::Node.new(2)
  tree.right = BinaryTree::Node.new(3)
  tree.left.left = BinaryTree::Node.new(nil)
  tree.left.right = BinaryTree::Node.new(4)
  tree.right.left = BinaryTree::Node.new(nil)
  tree.right.right = BinaryTree::Node.new(5)

  #[1,2,3,4,null,null,5]
  # [1,2,null,3,null,4,null,5]

  # test case
  # tree [3, 9, 20, null, null, 15, 7]
  # get [[3],[15,7],[9],[20]]
  # expected [[3],[15,7],[9, 20]]
  #
  class Level
    attr_reader :tree

    def initialize(tree)
      @tree = tree
    end

    def level_order
      results = []
      queue = []
      temp = []
      return [] if @tree.nil?
      queue << @tree

      root = queue.first
      results << [root.val]

      count_level_node = 0
      left = false
      right = false
      while !queue.empty? do

        next_node = queue.shift
        if  count_level_node == 2 && ( left && right )
          temp = []
          count_level_node = 0
        elsif count_level_node  == 1 && ( left || right )
          temp = []
          count_level_node = 0
        end

        unless next_node.left.nil?
          queue << next_node.left
          unless next_node.left.val.nil?
            temp << next_node.left.val
            count_level_node += 1
            left = true
          else
            left = false
          end
        end

        unless next_node.right.nil?
          queue << next_node.right
          unless next_node.right.val.nil?
            temp << next_node.right.val
            count_level_node += 1
            right = true
          else
            right = false
          end
        end

        results << temp
        results = results.reject { |r| r.empty? }
      end
       print results.uniq
    end


    def level_order_tree
      root = @tree
      return [] unless root
      queue, result, level = [], [], []
      num_nodes, current_count = 1, 0
      queue.unshift(root)

      while(!queue.empty?)
        current = queue.pop()
        current_count += 1
        level.push(current.val)

        queue.unshift(current.left) if current.left
        queue.unshift(current.right) if current.right

        if(current_count == num_nodes)
          result.unshift(level)
          level = []
          current_count = 0
          num_nodes = queue.length
        end

      end
      result = result.reverse.map { |r| r.compact }.reject { |r| r.empty? }
      result
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

    def max_depth(root)
      unless root.nil?
        depth = [max_depth( root.left ), max_depth( root.right )].max + 1
      else
        depth = 0
      end
      depth
    end

  end

  puts 'Level order traversal of tree :'
  self::Level.new(tree).level_order_tree
  puts '|------------------------------|'
  puts '----------Max Depth-------------'
  puts self::Level.new(tree).max_depth tree

end


