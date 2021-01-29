---
--- Lua 数组的常用操作
---
array = {}

---
--- 寻找是否存在符合条件的元素
--- source数据源，funcCond(element)判断条件，只要数组中有一个funcCond(element)结果为true，any结果为true否则为false。
---
---@param source table
---@param funcCond fun(element:any):boolean
---@return boolean
function array.any(source, funcCond)
    for _, element in pairs(source, cond) do
        if funcCond(element) then
            return true
        end
    end
    return false
end

---
--- 过滤方法返回一个新的数组
--- source数据源，fun(element:any)过滤条件，如果funcCond(value)为ture保存进新的数组。
---
---@param source table
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
--- source数据源，funcCond(element)查询条件，如果为true方法find返回这个元素,如果没有返回true的元素，find返回nil
---
---@param source table
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
--- 查找一个符合条件元素索引
--- source数据源，funcCond(element)查询条件，如果funcCond(element)结果为true方法findIndex返回元素索引，否则返回-1
---
---@param source table
---@param funcCond fun(element:any)
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
--- source数据源，funcGetNumber(element)返回需要累加的数字，如果funcGetNumber值为nil直接将数组每个元素累加。
---
---@param source table
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
--- 遍历
---
---@param source table @数据源
---@param callback fun(value:any) @回调会将source每个元素都放入callback方法执行一次
---@return table
function array.each(source, callback)
    local new = {}
    for _, element in pairs(source) do
        table.insert(new, callback(element))
    end
    return new
end

---
--- 遍历数组的每个元素
--- source数据源，func(element)数据调用的方法，如果结果为true继续向下执行，如果为false停止。
---
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
--- 冒泡排序
--- source数据库，funcLess(v1, v2)比较方法，如果v1>v2返回true,从小到大排序,如果v1<v2返回true从大到小排序。
---
---@param source table
---@param funcLess fun(v1:any, v2:any)
function array.bubbleSort(source, funcLess)
    local len = #source
    local flag = true
    for i = 0, len - 2, 1 do
        if not flag then
            break
        end
        flag = false
        for j = 1, len - i - 1, 1 do
            if funcLess(source[j], source[j + 1]) then
                source[j], source[j + 1] = source[j + 1], source[j]
                flag = true
            end
        end
    end
end

return array