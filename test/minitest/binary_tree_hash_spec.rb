require 'minitest/autorun'
require 'minitest/pride'
load 'binary_tree_hash.rb'



describe BinaryTree::HashNode do
  let(:bt_hash){ BinaryTree::HashNode.new(:test, 100) }
  specify { bt_hash[:test].must_equal 100 }
  specify { bt_hash[:missing].must_be_nil }

  specify "inserting a new value" do
    bt_hash[:hello] = 200
    bt_hash[:hello].must_equal 200
  end

  specify "overwriting an existing value" do
    bt_hash[:test] = 101
    bt_hash[:test].must_equal 101
  end

  specify "storing arbitrary objects as keys" do
    obj = Object.new
    bt_hash[obj] = 1001
    bt_hash[obj].must_equal 1001
  end

  specify "nesting hashes" do
    other_hash = BinaryTree::HashNode.new(:world, 102)
    bt_hash[:hello] = other_hash
    bt_hash[:hello][:world].must_equal 102
  end

  specify { bt_hash.fetch(:test).must_equal 100 }
  specify { bt_hash.fetch(:missing, 101).must_equal 101 }
  specify { ->{ bt_hash.fetch(:missing) }.must_raise KeyError }
  specify { bt_hash.fetch(:missing) { 101 }.must_equal 101 }


  let(:defaulting_hash){ BinaryTree::HashNode.new(:test, []){|hash, key| hash[key] = []} }
  specify { defaulting_hash[:empty].must_equal [] }

  specify "inserting values" do
    defaulting_hash[:my_array] << 1 << 2 << 3
    defaulting_hash[:my_array].must_equal [1, 2, 3]
  end
end