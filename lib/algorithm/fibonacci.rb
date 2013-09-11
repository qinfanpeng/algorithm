# -*- coding: utf-8 -*-

class Fibonacci

  # 递归版
  def recursion_produce(n)
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
    # todo ...x
  end

end
