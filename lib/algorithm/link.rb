# -*- coding: utf-8 -*-
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class Link
  def initialize
    @link = []
  end

  def << (node)
    @link.last.next = node if @link.last
    @link << node
    return self
  end
  # === 在时间复杂度为O(1)的情况下删除链表指定节点
  # - 1. 把待删除节点下一个节点内容复制到待删除节点.
  # - 2. 然后把待删除节点向下指针指向下一个节点的下一个节点.
  def delete_under_O1(node)
    if delete_last?(node)
      if only_one_node?
        @link.delete(node)
      else
        pre_of(node).next = nil
        @link.delete node
      end
    else
      _next = node.next
      node.data = _next.data
      node.next = _next.next
      @link.delete(_next)
    end
    datas
  end

  def delete_last?(node)
    node.next.nil?
  end

  def only_one_node?
    @link.size == 1
  end

  def pre_of(node)
    _node = @link.first
    while _node.next != node
      _node = _node.next
    end
    _node
  end

  def datas
    datas = []
    @link.each do |node|
      datas << node.data
    end
    return datas
  end
end
