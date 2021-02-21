# sort.lua

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