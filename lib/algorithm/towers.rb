# -*- coding: utf-8 -*-

class Tower

  # === 汉诺塔问题
  # n 个盘子借助B柱子从A移动到C，每次只能移动一个
  # 且移动过程中只能大盘子在下面小盘在在上面， 不能颠倒
  # src 表示原始柱子， aux表示辅助柱子， dst 表示目标柱子, solu 为解决方案
  #
  def recursion_towers(_args = {})
    args = {disks: 3, src: 'A', aux: 'B', dst: 'C', solu: []}.merge(_args)

    if args[:disks] == 1
      #puts "#{args[:src]} --> #{args[:dst]}"
      args[:solu] << "#{args[:src]} --> #{args[:dst]}"
    else
      recursion_towers({disks: args[:disks]-1,
                         src: args[:src],
                         aux: args[:dst],
                         dst: args[:aux],
                         solu: args[:solu]})     # 1.先递归把A上的 n-1 个盘子 借助 C 移动到 B 上
      recursion_towers({disks: 1,
                         src: args[:src],
                         aux: args[:aux],
                         dst: args[:dst],
                         solu: args[:solu]})     # 2.经上一步移动后 A上只剩一个盘子， 直接移动到C上
      recursion_towers({disks: args[:disks]-1,
                         src: args[:aux],
                         aux: args[:src],
                         dst: args[:dst],
                         solu: args[:solu]})     # 3.把第1步移动B上的n-1个盘子借助A也移动到C上，完成！
    end
    return args[:solu]
  end

  # 非递归版
  def towers(_args={})
    _args_ = {disks: 3, src: 'A', aux: 'B', dst: 'C'}.merge(_args)
    stack = []
    solution = []
    stack << _args_

    while not stack.empty?
      args = stack.pop
      if args[:disks] == 1
        solution << "#{args[:src]} --> #{args[:dst]}"
      else
        # 3.把第1步移动B上的n-1个盘子借助A也移动到C上，完成， 故最先 进栈
        stack << {disks: args[:disks]-1, src: args[:aux], aux: args[:src], dst: args[:dst] }
        # 2.经上一步移动后 A上只剩一个盘子， 直接移动到C上
        stack << {disks: 1, src: args[:src], aux: args[:aux], dst: args[:dst] }
        # 1.先递归把A上的 n-1 个盘子 借助 C 移动到 B 上, 故最后 进栈
        stack << {disks: args[:disks]-1, src: args[:src], aux: args[:dst], dst: args[:aux] }
      end
    end
    solution
  end

end
