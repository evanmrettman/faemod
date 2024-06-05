FaemodSavedVarsDefault = {
    debugEnabled = false,
    symmetricalPositionX = 135,
    symmetricalPositionY = -300,
    focusPositionX = 340,
    focusPositionY = -180,
}
local logger = Logger:new("vars.lua")

function Faemod_SaveVar(key, value)
    logger:debug("saving",key,value)
    FaemodSavedVars[key] = value
end

function Faemod_SaveDebugEnabled(enabled)
    FaemodSavedVars.debugEnabled = enabled
end

function Faemod_SaveDebugEnabled(enabled)
    Faemod_SaveVar("debugEnabled", enabled)
end

function Faemod_SaveSymmetricalPositionX(x)
    Faemod_SaveVar("symmetricalPositionX", x)
end

function Faemod_SaveSymmetricalPositionY(y)
    Faemod_SaveVar("symmetricalPositionY", y)
end

function Faemod_SaveFocusPositionX(x)
    Faemod_SaveVar("focusPositionX", x)
end

function Faemod_SaveFocusPositionY(y)
    Faemod_SaveVar("focusPositionY", y)
end

function Faemod_SaveNewValue(value)
    Faemod_SaveVar("newValue", value)
end

-- Faemod_LoadSavedVars()