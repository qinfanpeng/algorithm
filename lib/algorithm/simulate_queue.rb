# -*- coding: utf-8 -*-

# === 用两个栈来模拟队列
# 思路如下：：
# - 1. 进队列时， 把元素压入进队列辅助栈 @enq_stack
# - 2. 第一次出队列时候， 为了达到 “先进先出” 的顺序， 把进队列辅助栈中的元素全部压入
#   出队列辅助栈，弹出出队列辅助栈顶元素
# - 3. 再次出队列时， 如果出队列辅助栈非空， 直接弹出出队列辅助栈顶元素接口，
#   否则重复步骤2中的操作
# 类似的看simulate_stack.rb
class SimulateQueue
  attr_reader :length

  def initialize
    @enq_stack, @deq_stack = [], []
    @length = 0
  end

  def enq(n)
    @enq_stack << n
    @length += 1

    unless @deq_stack.empty?
      _deq_stack = @deq_stack.reverse
      return _deq_stack + @enq_stack
    end
    return @enq_stack
  end

  def deq
    if @deq_stack.empty?  #当出队列辅助栈为空时，把进队列辅助栈中元素全部压去出队列辅助栈
      while not @enq_stack.empty?
        @deq_stack << @enq_stack.pop
      end
    end

    unless @deq_stack.empty?  #队列非空时， ...
      @length -= 1
      return @deq_stack.pop
    else
      nil
    end
  end
end
