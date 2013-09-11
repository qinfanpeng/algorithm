# -*- coding: utf-8 -*-

class Fibonacci

  # 递归版
  def recursion_produce(n, result=[])
    return 1 if n == 0 or n == 1
    produce(n-1) + produce(n-2)
  end

  # 非递归版
  def produce(n)
    a = []
    a[0] = 1
    a[1] = 1
    if n == 0 or n ==1
      return 1
    elsif n >= 2
      for i in 2..n
        a[i] = a[i-1] + a[i-2]
      end
      return  a[n]
    end
  end

  def stack_produce(n)
    a = []
    a[0] = 1
    a[1] = 1
    if n == 0 or n == 1
      return a[n]
    else
      stack = []
      while n >= 0
        stack << a[n]
        n -= 1
      end

      top0 = stack.pop
      top1 = stack.pop
      i = 1
      while not stack.empty?
        top = stack.pop
        i += 1
        top = a[i] = top1 + top0  # 栈顶元素应该等于前面两个栈顶元素之和

        top0 = top1
        top1 = top
      end
      p a
      a[i]
    end
  end

end
