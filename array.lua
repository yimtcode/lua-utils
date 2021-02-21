-- lua array util
array = {}

---
--- find element
---
--- source: data source
--- funcCond function(element:any):boolean: find cond, if function funcCond(element) result true,
--- function any return true, if no once match function "any" return false.
---@param source any[]
---@param funcCond function(element:any):boolean
---@return boolean
function array.any(source, funcCond)
    for _, element in pairs(source) do
        if funcCond(element) then
            return true
        end
    end
    return false
end

---
--- 过滤方法返回一个新的数组
---
--- source数据源，fun(element:any)过滤条件，如果funcCond(value)为ture保存进新的数组。
---@param source any[]
---@param funcCond fun(element:any):boolean
---@return table
function array.filter(source, funcCond)
    local new = {}

    for _, element in pairs(source) do
        if funcCond(element) then
            table.insert(new, element)
        end
    end

    return new
end

---
--- 查找第一个符合条件元素
---
--- source数据源，funcCond(element)查询条件，如果为true方法find返回这个元素,如果没有返回true的元素，find返回nil
---@param source any[]
---@param funcCond fun(element:any)
---@return any
function array.find(source, funcCond)
    for _, element in pairs(source) do
        if funcCond(element) then
            return element
        end
    end

    return nil
end

---
--- find element index
---
--- source数据源，funcCond(element)查询条件，如果funcCond(element)结果为true方法findIndex返回元素索引，否则返回-1
---@param source any[]
---@param funcCond fun(element:any):boolean
---@return number
function array.findIndex(source, funcCond)
    for i, element in pairs(source) do
        if funcCond(element) then
            return i
        end
    end

    return -1
end

---
--- 统计总合
---
--- source数据源，funcGetNumber(element)返回需要累加的数字，如果funcGetNumber值为nil直接将数组每个元素累加。
---@param source any[]
---@param funcGetNumber fun(element:any)
---@return number
function array.sum(source, funcGetNumber)
    local sum = 0

    for _, element in pairs(source) do
        if nil == funcGetNumber then
            sum = sum + element
        else
            sum = sum + funcGetNumber(element)
        end
    end

    return sum
end

---
--- 对数组每个元素按func处理，并且返回一个新的数组
---
--- source待处理数组，func处理方法。
---@param source any[]
---@param func function(element:any):any
---@return any[]
function array.map(source, func)
    local new = {}

    for _, element in pairs(source) do
        table.insert(new, func(element))
    end

    return new
end

---
--- 遍历数组的每个元素
---
--- source数据源，func(element)数据调用的方法，如果结果为true继续向下执行，如果为false停止。
---@param source table
---@param func function(element:any):boolean
function array.forEach(source, func)
    for _, element in pairs(source) do
        if not func(element) then
            break
        end
    end
end

---
--- 将任意数量的数组合并
---
---@vararg any
---@return any[]
function array.merge(...)
    local source = { ... }
    local list = {}

    for _, arr in pairs(source) do
        for _, element in pairs(arr) do
            table.insert(list, element)
        end
    end

    return list
end

---
--- reduce
---
---@param source
---@param func function(item:any, result:any):any
---@return any
function array.reduce(source, func)
    assert(#source > 0, "empty error")

    if #source == 1 then
        return source[1]
    end

    local result = source[1]
    for i = 2, #source, 1 do
        result = func(source[i], result)
    end

    return result
end

return array