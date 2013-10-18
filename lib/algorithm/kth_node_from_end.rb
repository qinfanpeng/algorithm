# -*- coding: utf-8 -*-

class Link
  # === 在只遍历一次的条件返回单向链表的倒数第 k 个节点
  # - 1. 先让第一个指针 p1 从前向后走 k-1 步, 此时第二个指针 p2 #保持不动
  # - 2. 从第 k 步开始，两个指针同时移动，直到 p1 到达链表的尾节点时，此时 p2 所指节点即为所求。
  def kth_node_from_end(k)
    return nil if k == 0 or @link.size == 0
    p1 = p2 = @link.first
    (k-1).times do
      return nil unless p1.next
      p1 = p1.next
    end
    while p1.next != nil
      p1 = p1.next
      p2 = p2.next
    end
    return p2
  end
end
