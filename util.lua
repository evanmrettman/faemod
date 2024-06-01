local logger = Logger:new("util.lua")

function Faemod_SymmetricalPlayerFrames(x,y)
    logger:info('Setting Symmetrical Player & Target Frames (',x,',',y,')')
    PlayerFrame:ClearAllPoints() 
    PlayerFrame:SetMovable(true) 
        PlayerFrame:SetPoint("CENTER",UIParent,-x,y) 
        PlayerFrame:SetUserPlaced(true)
    PlayerFrame:SetMovable(false)
    TargetFrame:ClearAllPoints()
    TargetFrame:SetMovable(true) 
        TargetFrame:SetPoint("CENTER",UIParent,x,y)
        TargetFrame:SetUserPlaced(true)
    TargetFrame:SetMovable(false)
end

function Faemod_FocusFrame(x,y)
    logger:info('Setting Focus Frame (',x,',',y,')')
    FocusFrame:ClearAllPoints()
    FocusFrame:SetMovable(true) 
        FocusFrame:SetPoint("CENTER",UIParent,x,y)
        FocusFrame:SetUserPlaced(true)
    FocusFrame:SetMovable(false)
end
