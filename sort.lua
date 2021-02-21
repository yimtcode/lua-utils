-- array sort function
--
-- lua table is pointer pass no return need of result.
local sort = {}

---
--- bubble sort function
---
--- source: data source.
--- funcLess(v1, v2):boolean: compare function, if v1 > v2 result is true descend, else ascend.
---@param source any[]
---@param funcLess fun(v1:any, v2:any):boolean
function sort.bubbleSort(source, funcLess)
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

return sort