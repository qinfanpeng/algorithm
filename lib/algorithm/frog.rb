# -*- coding: utf-8 -*-
# == 青蛙跳级问题
# 一只青蛙一次可以跳跃1个台阶， 也可以跳跃2个台阶
# 求解这只青蛙跳上n个台阶共有多少中方法

class Frog

  # 把跳级看成关于n的函数jump(n), 则当n大于2时
  # 青蛙第一次跳跃就有两种选择：
  # - 一是第一次只跳跃1级，那么此时跳法数目就等于剩下的n-1个台阶的跳法数目，即为 jump(n-1)
  # - 二是第一次只跳跃2级，那么此时跳法数目就等于剩下的n-2个台阶的跳法数目，即为 jump(n-2)
  # 故，一共有 jump(n-1)+jump(n-2) 中跳法
  #
  def jump(n)
    raise "the number of steps must be greater than 0" if n <= 0
    return 1 if n == 1
    return 2 if n == 2
    jump(n-1)+jump(n-2)
  end
end
