-- array tool function
array = {}

---
--- find element
---
--- source: data source
--- funcCond: find cond, if function funcCond(element) result true,
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
--- filter return a  new table
---
--- source: data source.
--- funcCond: filter cond, if return true keep back else discard.
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
--- find first match element
---
--- source: data source.
--- funcCond: find cond.
---@param source any[]
---@param funcCond fun(element:any):boolean
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
--- source: data source.
--- funcCond: find cond.
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
--- amount
---
--- source: data source.
--- funcGetNumber: return need amount number, ignored direct accumulation of each item.
---@param source any[]
---@param funcGetNumber fun(element:any):number
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