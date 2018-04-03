require 'minitest/autorun'
load 'validate_binary_tree.rb'


describe "Valid Binary Tree" do

  before do
    @valid_tree = BinaryTree.valid_tree
    @invalid_tree = BinaryTree.invalid_tree
  end

  describe "Check Valid Tree" do
    it "should checking valid tree" do

      BinaryTree.is_valid_bst(@valid_tree).equal?  true

    end
  end


  describe "Check InValid Tree" do
    it "should checking invalid tree" do

      BinaryTree.is_valid_bst(@invalid_tree).equal? false

    end
  end

end
