local logger = Logger:new("faemod.lua")

local function Faemod_EventHandler(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == "faemod" then
            FaemodSavedVars = FaemodSavedVars or FaemodSavedVarsDefault
            Faemod_InitAddonConfig()
        end
    end
end

local Faemod_EventFrame = CreateFrame("Frame")
Faemod_EventFrame:RegisterEvent("ADDON_LOADED")
Faemod_EventFrame:SetScript("OnEvent", Faemod_EventHandler)