# -*- coding: utf-8 -*-

# == 用两个队列模拟栈
# 进栈时， 直接进入进栈辅助队列@push_queue即可
# 出栈时::
# - 1.如果进栈辅助队列只有一个元素， 直接出队列即可
# - 2.如果进栈辅助队列不止一个元素， 假设n个（n>1）， 先把队列前面
#   n-1 个元素弹出进栈辅助队列， 然后压入出栈辅助队列， 然后剩下
#   进栈辅助队列中一个元素， 直接出来即可。
# - 3. 如果进栈辅助队列为空，首先看出栈辅助队列是否有元素，
#   如果有，把它们全部弄进进栈辅助队列，然后重复上面1、2两步
#   如果没得， 则直接返回 nil
class SimulateStack
  attr_reader :size

  def initialize
    @push_queue, @pop_queue = [], []
    @size = 0
  end

  def push(item)
    @push_queue.push item
    @size += 1
    @push_queue.reverse
  end

  def <<(item)
    push(item)
  end

  def pop
    let_items_back_from_pop_queue_to_push_queue

    shift_n_1_items_from_push_queue

    pop_item_from_push_queue
  end

  def let_items_back_from_pop_queue_to_push_queue
    if @push_queue.empty? and (not @pop_queue.empty?)
      while not @pop_queue.empty?
        @push_queue.push @pop_queue.shift
      end
    end
  end

  def shift_n_1_items_from_push_queue
    if @push_queue.size > 1
      (@push_queue.size-1).times do
        @pop_queue.push @push_queue.shift
      end
    end
  end

  def pop_item_from_push_queue
    if @push_queue.size == 1
      @size -= 1
      return @push_queue.shift
    else
      return nil
    end
  end
end
