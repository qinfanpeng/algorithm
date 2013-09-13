# -*- coding: utf-8 -*-
class Tree
  attr_accessor :data, :left, :right

  def initialize(data=nil)
    @data, @left, @right = data, nil, nil
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
    stack = []

    result << @data
    # 先判断左、右子树是否改进站
    stack << @right if @right
    stack << @left if @left

    while not stack.empty?
      tree = stack.pop

      result << tree.data           # 如果栈中有左子树，取出其中data， 继续判断它的左右子树是否该进栈
      stack << tree.right if tree.right
      stack << tree.left if tree.left
    end
    result
  end

  # === 递归版中序遍历
  def recursion_inorder_traversal(result=[])
    @left.recursion_inorder_traversal(result) if @left
    result << @data
    @right.recursion_inorder_traversal(result) if @right
    result
  end

  # === 栈版中序遍历
  def stack_inorder_traversal
    stack = []
    result = []

    stack << @right if @right
    stack << @data                 # 把data同tree子树一起进栈，才好控制顺序
    stack << @left if @left

    while not stack.empty?
      element = stack.pop

      unless element.respond_to? :right # 表示此时为data，故不响应right方法
        result << element
        next
      end

      stack << element.right if element.right
      stack << element.data
      stack << element.left if element.left
    end
    result
  end
  # === 打印一棵树()
  def print
    # todo: 等层级遍历完成后，再来弄x
  end
















  private
  def stack_push_tree(stack, tree)
    stack << tree.right if tree.right
    stack << tree.left if tree.left
  end
end
