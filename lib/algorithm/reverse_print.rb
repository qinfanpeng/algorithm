# -*- coding: utf-8 -*-

class ReversePrinter
  #
  # 从后向前打印链表（此处用数组模拟），尽量不使用ruby的
  # reverse_*等高级语法

  # 基于栈思想版
  def stack_reverse_print(a)
    result = []
    while e = a.pop
      result << e
    end
    return result
  end

  # 基于递归版
  # 递归思想和栈的思想有很大的关联， 很多时候两种策略可以互换
  def recursion_reverse_print(a, result=[])
    if a.size == 1
      result << a[0]
    else
      item = a.shift  # 去掉a的第一个元素
      recursion_reverse_print(a, result)  # 先递归打印出当前元素后面的
      result << item                      # 再打印当前元素
    end
    result
  end
end
