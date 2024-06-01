Logger = {}
Logger.__index = Logger

function Logger:new(name)
    local self = setmetatable({}, Logger)
    self.name = name or "unknown"
    self:debug("Logger Initialized")
    return self
end

function Logger:info(...)
    local args = {...}
    local string = 'Faemod [INFO]: '
    for i, v in pairs(args) do
        string = string .. tostring(v) .. " "
    end
    print(string)
end

function Logger:debug(...)
    if FaemodSavedVars ~= nil and FaemodSavedVars.debugEnabled then
        local args = {...}
        local string = 'Faemod [DEBUG@' .. self.name .. ']: '
        for i, v in pairs(args) do
            string = string .. tostring(v) .. " "
        end
        print(string)
    end
end