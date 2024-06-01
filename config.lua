local logger = Logger:new("config.lua")

FaemodOptionsPanel = CreateFrame("Frame", "FaemodOptionsPanel", UIParent)
FaemodOptionsPanel.name = "Faemod"

local createSlider = function(name, parent, label, minVal, maxVal, step, defaultVal, onChangeFunc)
    local slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)
    slider:SetValue(defaultVal)
    _G[slider:GetName() .. 'Low']:SetText(tostring(minVal))
    _G[slider:GetName() .. 'High']:SetText(tostring(maxVal))
    _G[slider:GetName() .. 'Text']:SetText(label)
    slider:SetScript("OnValueChanged", onChangeFunc)
    return slider
end

local createInputBox = function(name, parent, defaultVal, onChangeFunc)
    local inputBox = CreateFrame("EditBox", name, parent, "InputBoxTemplate")
    inputBox:SetAutoFocus(false)
    inputBox:SetSize(40, 20)
    inputBox:SetText(tostring(defaultVal))
    inputBox:SetCursorPosition(0)
    inputBox:SetScript("OnEnterPressed", function(self)
        local value = tonumber(self:GetText())
        if value then
            onChangeFunc(self, value)
        end
        self:ClearFocus()
    end)
    return inputBox
end

function Faemod_InitAddonConfig()
    local title = FaemodOptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Faemod Configuration")

    local xSliderOffsetFromTitle = -10
    local yInputOffset = -25
    
    local subtitle = FaemodOptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    subtitle:SetPoint("TOP", title, "CENTER", 0, -8)
    subtitle:SetText("Configure the settings for Faemod.")
    
    local debugCheckbox = CreateFrame("CheckButton", "FaemodDebugCheckbox", FaemodOptionsPanel, "InterfaceOptionsCheckButtonTemplate")
    debugCheckbox:SetPoint("BOTTOMLEFT", FaemodOptionsPanel, "BOTTOMLEFT", 16, 16)
    debugCheckbox.Text:SetText("Enable Debug Messages")
    
    debugCheckbox:SetScript("OnClick", function(self)
        local isChecked = self:GetChecked()
        Faemod_SaveDebugEnabled(isChecked)
    end)
    
    local symmetricalTitle = FaemodOptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    symmetricalTitle:SetPoint("TOP", subtitle, 0, -25)
    symmetricalTitle:SetText("Symmetrical Position")

    local symmetricalPositionXSlider = createSlider("FaemodSymmetricalPositionXSlider", FaemodOptionsPanel, "X", -500, 500, 1, FaemodSavedVars.symmetricalPositionX, function(self, value)
        Faemod_SaveSymmetricalPositionX(value)
        Faemod_SymmetricalPlayerFrames(value, FaemodSavedVars.symmetricalPositionY)
    end)
    symmetricalPositionXSlider:SetPoint("TOP", symmetricalTitle, "BOTTOM", xSliderOffsetFromTitle, yInputOffset)

    local symmetricalPositionYSlider = createSlider("FaemodSymmetricalPositionYSlider", FaemodOptionsPanel, "Y", -500, 500, 1, FaemodSavedVars.symmetricalPositionY, function(self, value)
        Faemod_SaveSymmetricalPositionY(value)
        Faemod_SymmetricalPlayerFrames(FaemodSavedVars.symmetricalPositionX, value)
    end)
    symmetricalPositionYSlider:SetPoint("TOP", symmetricalPositionXSlider, "BOTTOM", 0, yInputOffset)



    local symmetricalPositionXInput = createInputBox("FaemodSymmetricalPositionXInput", FaemodOptionsPanel, FaemodSavedVars.symmetricalPositionX, function(self, value)
        symmetricalPositionXSlider:SetValue(value)
        Faemod_SaveSymmetricalPositionX(value)
        Faemod_SymmetricalPlayerFrames(value, FaemodSavedVars.symmetricalPositionY)
    end)
    symmetricalPositionXInput:SetPoint("LEFT", symmetricalPositionXSlider, "RIGHT", 10, 0)

    local symmetricalPositionYInput = createInputBox("FaemodSymmetricalPositionYInput", FaemodOptionsPanel, FaemodSavedVars.symmetricalPositionY, function(self, value)
        symmetricalPositionYSlider:SetValue(value)
        Faemod_SaveSymmetricalPositionY(value)
        Faemod_SymmetricalPlayerFrames(FaemodSavedVars.symmetricalPositionX, value)
    end)
    symmetricalPositionYInput:SetPoint("LEFT", symmetricalPositionYSlider, "RIGHT", 10, 0)

    local focusTitle = FaemodOptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    focusTitle:SetPoint("BOTTOM", symmetricalPositionYSlider, "BOTTOM", -xSliderOffsetFromTitle, yInputOffset)
    focusTitle:SetText("Focus Position")

    local focusPositionXSlider = createSlider("FaemodFocusPositionXSlider", FaemodOptionsPanel, "X", -500, 500, 1, FaemodSavedVars.focusPositionX, function(self, value)
        Faemod_SaveFocusPositionX(value)
        Faemod_FocusFrame(value, FaemodSavedVars.focusPositionY)
    end)
    focusPositionXSlider:SetPoint("TOP", focusTitle, "BOTTOM", xSliderOffsetFromTitle, yInputOffset)

    local focusPositionYSlider = createSlider("FaemodFocusPositionYSlider", FaemodOptionsPanel, "Y", -500, 500, 1, FaemodSavedVars.focusPositionY, function(self, value)
        Faemod_SaveFocusPositionY(value)
        Faemod_FocusFrame(FaemodSavedVars.focusPositionX, value)
    end)
    focusPositionYSlider:SetPoint("TOP", focusPositionXSlider, "BOTTOM", 0, yInputOffset)

    local focusPositionXInput = createInputBox("FaemodFocusPositionXInput", FaemodOptionsPanel, FaemodSavedVars.focusPositionX, function(self, value)
        focusPositionXSlider:SetValue(value)
        Faemod_SaveFocusPositionX(value)
        Faemod_FocusFrame(value, FaemodSavedVars.focusPositionY)
    end)
    focusPositionXInput:SetPoint("LEFT", focusPositionXSlider, "RIGHT", 10, 0)

    local focusPositionYInput = createInputBox("FaemodFocusPositionYInput", FaemodOptionsPanel, FaemodSavedVars.focusPositionY, function(self, value)
        focusPositionYSlider:SetValue(value)
        Faemod_SaveFocusPositionY(value)
        Faemod_FocusFrame(FaemodSavedVars.focusPositionX, value)
    end)
    focusPositionYInput:SetPoint("LEFT", focusPositionYSlider, "RIGHT", 10, 0)

    local resetButton = CreateFrame("Button", "FaemodResetButton", FaemodOptionsPanel, "UIPanelButtonTemplate")
    resetButton:SetSize(120, 22)
    resetButton:SetPoint("BOTTOMRIGHT", FaemodOptionsPanel, "BOTTOMRIGHT", -16, 16)
    resetButton:SetText("Reset to Defaults")
    resetButton:SetScript("OnClick", function()
        FaemodSavedVars = CopyTable(FaemodSavedVarsDefault)
        symmetricalPositionXSlider:SetValue(FaemodSavedVars.symmetricalPositionX)
        symmetricalPositionYSlider:SetValue(FaemodSavedVars.symmetricalPositionY)
        focusPositionXSlider:SetValue(FaemodSavedVars.focusPositionX)
        focusPositionYSlider:SetValue(FaemodSavedVars.focusPositionY)
        symmetricalPositionXInput:SetText(tostring(FaemodSavedVars.symmetricalPositionX))
        symmetricalPositionYInput:SetText(tostring(FaemodSavedVars.symmetricalPositionY))
        focusPositionXInput:SetText(tostring(FaemodSavedVars.focusPositionX))
        focusPositionYInput:SetText(tostring(FaemodSavedVars.focusPositionY))
    end)

    InterfaceOptions_AddCategory(FaemodOptionsPanel)
    Faemod_SymmetricalPlayerFrames(FaemodSavedVars.symmetricalPositionX, FaemodSavedVars.symmetricalPositionY)
    Faemod_FocusFrame(FaemodSavedVars.focusPositionX, FaemodSavedVars.focusPositionY)
end
