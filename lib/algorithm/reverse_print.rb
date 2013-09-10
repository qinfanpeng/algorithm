# -*- coding: utf-8 -*-

class ReversePrinter
  def initialize
    Array.class_eval do
      define_method :myshift do
        self.shift
        self
      end
    end
  end
  #
  # 从后向前打印链表（此处用数组模拟），尽量不使用ruby的
  # reverse_*等高级语法

  # 基于栈思想版
  def reverse_print(a)
    result = []
    while e = a.pop
      result << e
    end
    return result
  end

  # 基于递归版
  # 递归思想和栈的思想有很大的关联， 很多时候两种策略可以互换
  def reverse_print1(a)
    # todo
  end
end
