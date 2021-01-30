# table

- copy(source):table

  > table深拷贝

  **示例**

  ```lua
  a = {name="yimt"}
  b = tab.copy(a)
  
  a.name = "yimtcode"
  
  print("a.name:" .. a.name .. "\n" .. "b.name:" .. b.name)
  
  --[[
  a.name:yimtcode
  b.name:yimt
  ]]
  ```

  

