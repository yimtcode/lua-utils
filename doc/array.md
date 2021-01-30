# array.lua

- any(source, function(element):boolean):boolean

  > 只要有一个符合条件的为true,否则为false

  **示例**

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

  **示例**

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

  **示例**

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

  **示例**

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

  **示例**

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

- bubbleSort(source, function(element):boolean)

  > 冒泡排序

  **示例**

  ```lua
  arr = { 4, 1, 2, 3 }
  
  array.bubbleSort(arr, function(v1, v2)
      return v1 > v2
  end)
  
  for _, v in pairs(arr) do
      print(v)
  end
  --[[
  1
  2
  3
  4
  ]]
  ```

