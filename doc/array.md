# array.lua

- ## any(source, function(element):boolean):boolean

  > 只要有一个符合条件的为true,否则为false

  **Example**

  ```lua
  b = array.any({ 2, 3, 4 }, function(element)
      return element > 4
  end)
  
  print(b)
  --[[
  false
  ]]
  ```

- filter(source, function(element):boolean):table

  > 返回一个过滤之后的数组

  **Example**

  ```lua
  newArr = array.filter({ 2, 3, 4 }, function(element)
      return element > 2
  end)
  
  for _, v in pairs(newArr) do
      print(v)
  end
  --[[
  3
  4
  ]]
  ```

- find(source, function(element):boolean):any

  > 返回第一个符合条件的元素，如果不存在符合条件的元素返回nil

  **Example**

  ```lua
  v = array.find({ 2, 3, 4 }, function(element)
      return element == 4
  end)
  
  print(v)
  --[[
  4
  ]]
  ```

- findIndex(source, function(element):boolean):number

  >  查找元素索引，如果找到返回索引，如果没有找到返回-1

  **Example**

  ```lua
  index = array.findIndex({ 2, 3, 4 }, function(element)
      return element == 4
  end)
  
  print(index)
  --[[
  3
  ]]
  ```

- map(source, function(element):any):table

  > 对数组每个元素进行处理，返回处理过后的数组

  **Example**

  ```lua
  newArr = array.map({ 1, 2, 3 }, function(element)
      return element * 2
  end)
  
  for _, v in pairs(newArr) do
      print(v)
  end
  --[[
  2
  4
  6
  ]]
  ```

- sum(source, function(element):number):number

  > 统计总合

  **Example**

  ```lua
  --1.
  sum = array.sum({1, 2, 3})
  
  print(sum)
  --[[
  6
  ]]
  
  --2.
  sum = array.sum({ 1, 2, 3 }, function(element)
      return element * 2
  end)
  
  print(sum)
  --[[
  12
  ]]
  ```

- forEach(source, function(element):boolean)

  > 遍历每个元素

  **示例**

  ```lua
  arr = { 1, 2, 3 }
  
  array.forEach(arr, function(element)
      print(element)
  
      return element ~= 2
  end)
  --[[
  1
  2
  ]]
  ```

- merge(...):table

  > 合并任意数量数组

  **Example**

  ```lua
  arr1 = { 1, 2 }
  arr2 = { 3, 4 }
  
  newArr = array.merge(arr1, arr2)
  for _, v in pairs(newArr) do
      print(v)
  end
  --[[
  1
  2
  3
  4
  ]]
  ```

- reduce(source, function(item:any, result:any):any):any

  > 按指定方法处理一个数组，返回一个结果

  **Example**
  
  ```lua
  -- 1.合计
  arr = { 1, 2, 3 }
  
  result = array.reduce(arr, function(item, result)
      return item + result
  end)
  print(result)
  --[[
  6
  ]]
  
  -- 2.查找最大值
  arr = { 4, 1, 3 }
  result = array.reduce(arr, function(item, result)
      if item > result then
          return item
      else
          return result
      end
  end)
  print(result)
  --[[
  4
  ]]
  ```

- max(source, function(element):number): any

  > 寻找最大对象，function可选

  **Example**

  ```lua
  -- 1.simple
  min = array.min({1, 2, 3})
  print(min)
  --[[
  1
  ]]
  
  -- 2.table array
  list = {
      {name="a", age=4},
      {name="b", age=2},
      {name="c", age=3}
  }
  m = array.min(list, function(item)
      return item.age
  end)
  print(m.name, m.age)
  --[[
  b       2
  ]]
  ```

- min(source, function(element):number): any

  > 寻找最小对象，function可选

  **Example**

  ```lua
  -- 1.simple
  min = array.min({1, 2, 3})
  print(min)
  --[[
  3
  ]]
  
  -- 2.table array
  list = {
      {name="a", age=4},
      {name="b", age=2},
      {name="c", age=3}
  }
  m = array.max(list, function(item)
      return item.age
  end)
  print(m.name, m.age)
  --[[
  a       4
  ]]
  ```

- reverse(source):any[]

  > 颠倒数组

  **Example**

  ```lua
  arr = array.reverse({1, 2, 3})
  for i, v in pairs(arr) do
      print(v)
  end
  --[[
  3
  2
  1
  ]]
  ```

  