---
--- table的常用工具方法，取名为tab是为防止和table重名覆盖。
---
local tab = {}

---
--- table深拷贝
--- source原始table，返回一个拷贝
---
---@param source table
---@return any
function tab.copy(source)
    if type(source) ~= 'table' then
        return source
    end

    local new = {}
    for k, v in pairs(source) do
        new[k] = tab.copy(v)
    end

    return new
end

return tab