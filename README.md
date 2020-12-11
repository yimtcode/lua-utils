# lua-util

> 自己封装的一些常用的lua工具库

## enum.lua

- any: 只要有一个符合条件的为true,否则为false

  ```lua
  b = enum.any({2, 3, 4}, function(value)
      return value > 4
  end)
  
  print(b)
  
  --[[
  false
  ]]
  ```

- filter: 过滤不符合条件的元素

  ```lua
  arr = enum.filter({2, 3, 4}, function(value)
      return value > 2
  end)
  
  for _, v in pairs(arr) do
      print(v)
  end
  
  --[[
  3
  4
  ]]
  ```

- find: 查找一个符合条件的元素

  ```lua
  value = enum.find({2, 3, 4}, function(value)
      return value == 4
  end)
  
  print(value)
  
  --[[
  4
  ]]
  ```

- each: 对所有元素执行操作

  ```lua
  arr = enum.each({1, 2, 3}, function(value) 
  return value * 2
  end)
  
  for _, v in pairs(arr) do
      print(v)
  end
  
  --[[
  2
  4
  6
  ]]
  ```

## tables.lua

- copy: table深拷贝