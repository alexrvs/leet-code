require 'minitest/autorun'
require 'minitest/assertions'
load 'binary_tree_iterator.rb'


describe "Iterator Binary Tree" do

  before do
    @iteration_tree = BinaryTree::run
  end

  describe "Check Valid Iteration By Tree" do

    it "Must Match Tree" do
      @iteration_tree.must_equal [7,3,8,2,4,5,9]
    end
  end

  describe "Assert Valid Iteration By Tree" do

    it "Match Actually with Expect Tree" do
        expect(@iteration_tree).equal? [7,3,8,2,4,5,9]
    end
  end
end

