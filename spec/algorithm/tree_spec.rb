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

  shared_examples_for "layer order traversal" do |traversal|
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
      t7.send(traversal).should == [1, 2, 5, 3, 4, 6, 7]
    end
  end

  shared_examples_for "create by preorder list and inorder list" do |create|
    it "1 node" do
      Tree.send(create, [1], [1]).should eql Tree.new(1)
    end
    it "2 nodes" do
      Tree.send(create, [1, 2], [2, 1]).should eql t2_l
      t2_l.print

      Tree.send(create, [1, 2], [1, 2]).should eql t2_r
      t2_r.print
    end
    it "3 nodes" do
      Tree.send(create, [1, 2, 3], [2, 1, 3]).should eql t3_l_r
      t3_l_r.print

      Tree.send(create, [1, 2, 3], [3, 2, 1]).should eql t3_l_l
      t3_l_l.print
    end
    it "4 nodes" do
      Tree.send(create, [1, 2, 3, 4], [3, 2, 4,1]).should eql t4_l_l_r
      t4_l_l_r.print
    end
    it "and more nodes" do
      Tree.send(create, [1, 2, 3, 4, 5, 6, 7], [3, 2, 4, 1, 6, 5, 7]).should eql t7
      t7.print
    end
  end

  context "recursion" do
    it_behaves_like "preorder traversal", :recursion_preorder_traversal
    it_behaves_like "inorder traversal", :recursion_inorder_traversal
    it_behaves_like "postorder traversal", :recursion_postorder_traversal
    it_behaves_like "layer order traversal", :recursion_layer_torder_traversal
    it_behaves_like "create by preorder list and inorder list", :recursion_create_by_preorder_and_inorder_list
  end
  context "stack style" do
    it_behaves_like "preorder traversal", :stack_preorder_traversal
    it_behaves_like "inorder traversal", :stack_inorder_traversal
    it_behaves_like "postorder traversal", :stack_postorder_traversal
    it_behaves_like "layer order traversal", :stack_layer_torder_traversal
    #it_behaves_like "create by preorder list and inorder list", :stack_create_by_preorder_and_inorder_list
  end

end
