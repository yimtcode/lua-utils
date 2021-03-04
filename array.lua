-- array tool function
array = {}

---
--- find element
---@param source any[] @data source
---@param funcCond fun(element:any):boolean @find cond, if function funcCond(element) result true, function any
--- return true, if no once match function "any" return false
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
---@param source any[] @data source
---@param funcCond fun(element:any):boolean @filter cond, if return true keep back else discard.
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
--- process every element
---@param source table @data source
---@param func function(element:any):any
---@return table @new table
function array.map(source, func)
    local new = {}

    for _, element in pairs(source) do
        table.insert(new, func(element))
    end

    return new
end

---
--- travel element
---@param source table @data source
---@param func function(element:any):boolean
function array.forEach(source, func)
    for _, element in pairs(source) do
        if not func(element) then
            break
        end
    end
end

---
--- merge multiple array
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
---@param source table
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

---
--- min
---@param source table
---@param func function(element):number @optional function
---@return any
function array.min(source, func)
    assert(#source ~= 0, "empty error")

    local min = nil
    local minNumber
    for _, v in pairs(source) do
        local t = v
        if func ~= nil then
            t = func(t)
        end

        if min == nil or minNumber > t then
            min = v
            minNumber = t
        end
    end

    return min
end

---
--- max
---@param source table
---@param func function(element):number @optional function
---@return any
function array.max(source, func)
    assert(#source ~= 0, "empty error")

    local max = nil
    local maxNumber = 0

    for _, v in pairs(source) do
        local t = v
        if func ~= nil then
            t = func(t)
        end

        if max == nil or maxNumber < t then
            max = v
            maxNumber = t
        end
    end

    return max
end

return array