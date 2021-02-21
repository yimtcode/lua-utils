# strings

- split(str, sep):string[]

  > split string

  **Example**

  ```lua
  arr = split("abc.123", ".")
  for i, v in pairs(arr) do
      print(v)
  end
  
  --[[
  abc
  123
  ]]
  ```

  