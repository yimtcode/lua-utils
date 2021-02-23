-- strings tool function
local strings = {}

---
--- split string
---
---@param str string
---@param sep string
---@return string[]
function strings.split(str, sep)
    local startIndex = 1
    local strArray = {}

    while true do
        local endIndex = string.find(str, sep, startIndex, true)
        if endIndex == nil then
            local s = string.sub(str, startIndex, #str)
            table.insert(strArray, s)
            break
        end

        local s = string.sub(str, startIndex, endIndex - 1)
        table.insert(strArray, s)
        startIndex = endIndex + 1
    end

    return strArray
end

return strings