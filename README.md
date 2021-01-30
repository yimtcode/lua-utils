# lua-utils

> 自己封装的一些常用的lua工具库

## array.lua

- any: 只要有一个符合条件的为true,否则为false

  ```lua
  b = array.any({ 2, 3, 4 }, function(element)
      return element > 4
  end)
  
  print(b)
  --[[
  false
  ]]
  ```
  
- filter: 返回一个新的符合条件的数组

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
  
- find: 查找一个符合条件的元素，如果找到返回元素，如果没有找到返回nil

  ```lua
  v = array.find({ 2, 3, 4 }, function(element)
      return element == 4
  end)
  
  print(v)
  --[[
  4
  ]]
  ```
  
- findIndex: 查找元素索引，如果找到返回索引，如果没有找到返回-1

  ```lua
  index = array.findIndex({ 2, 3, 4 }, function(element)
      return element == 4
  end)
  
  print(index)
  --[[
  3
  ]]
  ```
  
- map: 对所有元素执行操作

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
  
- sum: 统计总合

  ```lua
  sum = array.sum({1, 2, 3})
  
  print(sum)
  --[[
  6
  ]]
  
  sum = array.sum({ 1, 2, 3 }, function(element)
      return element * 2
  end)
  
  print(sum)
  --[[
  12
  ]]
  ```

- forEach: 遍历每个元素

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

- merge: 合并数组

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



- bubbleSort: 冒泡排序

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

## tab.lua

- copy: table深拷贝

  ```lua
  a = {name="yimt"}
  b = utils.copy(a)
  
  a.name = "yimtcode"
  
  print("a.name:" .. a.name .. "\n" .. "b.name:" .. b.name)
  
  --[[
  a.name:yimtcode
  b.name:yimt
  ]]
  ```

  