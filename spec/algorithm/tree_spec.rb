# -*- coding: utf-8 -*-

require 'spec_helper'
describe Tree do

  def t2_l
    t = Tree.new 1                  #    1
    t.left = Tree.new 2             #  2
    t
  end

  def t2_r
    t = Tree.new 1                  #    1
    t.right = Tree.new 2            #      2
    t
  end

  def t3_l_r
    t = Tree.new 1                  #        1
    t.left = Tree.new 2             #      2   3
    t.right = Tree.new 3            #
    t
  end

  def t3_l_l
    t = Tree.new 1                  #       1
    t2_l = t.left = Tree.new 2      #     2
    t2_l.left = Tree.new 3          #   3
    t
  end

  def t4_l_l_r
    t = Tree.new 1                        #            1
    t1_l = t.left = Tree.new 2            #          2
    t2_l = t1_l.left = Tree.new 3         #        3   4
    t2_r = t1_l.right = Tree.new 4        #
    t
  end

  def t7
    t = Tree.new 1                        #            1
    t2_l = t.left = Tree.new 2            #        2       5
    t3_l = t2_l.left = Tree.new 3         #      3   4   6   7
    t3_r = t2_l.right = Tree.new 4        #

    t2_r = t.right = Tree.new 5
    t3_r_l = t2_r.left = Tree.new 6
    t3_r_r = t2_r.right = Tree.new 7
    t
  end

  shared_examples_for "preorder traversal" do |traversal|
    it "1 node" do
      Tree.new(1).send(traversal).should == [1]
    end
    it "2 nodes" do
      t2_l.send(traversal).should == [1, 2]
      t2_r.send(traversal).should == [1, 2]
    end
    it "3 nodes" do
      t3_l_r.send(traversal).should == [1, 2, 3]
      t3_l_l.send(traversal).should == [1, 2, 3]
    end
    it "4 nodes" do
      t4_l_l_r.send(traversal).should == [1, 2, 3, 4]
    end
    it "and more" do
      t7.send(traversal).should == [1, 2, 3, 4, 5, 6, 7]
    end
  end

  shared_examples_for "inorder traversal" do |traversal|
    it "1 node" do
      Tree.new(1).send(traversal).should == [1]
    end
    it "2 nodes" do
      t2_l.send(traversal).should == [2, 1]
      t2_r.send(traversal).should == [1, 2]
    end
    it "3 nodes" do
      t3_l_r.send(traversal).should == [2, 1, 3]
      t3_l_l.send(traversal).should == [3, 2, 1]
    end
    it "4 nodes" do
      t4_l_l_r.send(traversal).should == [3, 2, 4, 1]
    end
    it "and more" do
      t7.send(traversal).should == [3, 2, 4, 1, 6, 5, 7]
    end
  end

  shared_examples_for "postorder traversal" do |traversal|
    it "1 node" do
      Tree.new(1).send(traversal).should == [1]
    end
    it "2 nodes" do
      t2_l.send(traversal).should == [2, 1]
      t2_r.send(traversal).should == [2, 1]
    end
    it "3 nodes" do
      t3_l_r.send(traversal).should == [2, 3, 1]
      t3_l_l.send(traversal).should == [3, 2, 1]
    end
    it "4 nodes" do
      t4_l_l_r.send(traversal).should == [3, 4, 2, 1]
    end
    it "and more" do
      t7.send(traversal).should == [3, 4, 2, 6, 7, 5, 1]
    end
  end

  context "recursion" do
    it_behaves_like "preorder traversal", :recursion_preorder_traversal
    it_behaves_like "inorder traversal", :recursion_inorder_traversal
    it_behaves_like "postorder traversal", :recursion_postorder_traversal
  end
  context "stack style" do
    it_behaves_like "preorder traversal", :stack_preorder_traversal
    it_behaves_like "inorder traversal", :stack_inorder_traversal
  end

  context "print" do
    it "1 node" do
      #Tree.new(1).print.should == '1'
    end
    it "2 nodes" do
s =<<END
  1
2
END

      #t2_l.print.should == s
    end
  end
end
