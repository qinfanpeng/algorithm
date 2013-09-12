# -*- coding: utf-8 -*-
class Tree
  attr_accessor :data
  attr_accessor :left
  attr_accessor :right

  def initialize(data=nil)
    @data = data
    @left = nil
    @right = nil
  end

  # === 递归版先序遍历
  def recursion_preorder_traversal(result=[])
    result << @data
    @left.recursion_preorder_traversal(result) if @left
    @right.recursion_preorder_traversal(result) if @right
    result
  end

  # === 栈思想版先序遍历
  def stack_preorder_traversal
    result = []
    result << @data

    stack = []
    stack_push_tree(stack, self)    # 先判断左、右子树是否改进站

    while not stack.empty?
      tree = stack.pop
      result << tree.data           # 如果栈中有左子树，取出其中data， 继续判断它的左右子树是否该进栈
      stack_push_tree(stack, tree)
    end
    result
  end

  # === 递归版中序遍历
  def recursion_ineorder_traversal(result=[])
    @left.recursion_ineorder_traversal(result) if @left
    result << @data
    @right.recursion_ineorder_traversal(result) if @right
    result
  end

  private
  def stack_push_tree(stack, tree)
    if tree.right
      stack << tree.right
    end
    if tree.left
      stack << tree.left
    end
  end
end
