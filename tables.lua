-- table tool function
local tables = {}

---
--- table deep copy
---@param source any
---@return any
function tables.copy(source)
    if type(source) ~= 'table' then
        return source
    end

    local new = {}
    for k, v in pairs(source) do
        new[k] = tables.copy(v)
    end

    return new
end

return tables